package pl.wsei.store.service;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import pl.wsei.store.model.Basket;

import java.util.List;

public class BasketService {

    private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("pu");

//    public void buyItem(String item, int quantity) {
//        EntityManager em = emf.createEntityManager();
//        try {
//            em.getTransaction().begin();
//
//            Basket basket = new Basket();
//            basket.setItem(item);
//            basket.setQuantity(quantity);
//            em.persist(basket);
//
//            em.getTransaction().commit();
//        } catch (Exception e) {
//            em.getTransaction().rollback();
//            throw e;
//        } finally {
//            em.close();
//        }
//    }

    public void buyItem(String item, int quantity) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();

            // Wyszukaj istniejący rekord w koszyku na podstawie item
            Basket existingBasket = em.createQuery("SELECT b FROM Basket b WHERE b.item = :item", Basket.class)
                    .setParameter("item", item)
                    .getResultStream()
                    .findFirst()
                    .orElse(null);

            if (existingBasket != null) {
                // Jeśli rekord istnieje, dodaj nową ilość do istniejącej ilości
                existingBasket.setQuantity(existingBasket.getQuantity() + quantity);
                em.merge(existingBasket);
            } else {
                // Jeśli rekord nie istnieje, utwórz nowy
                Basket newBasket = new Basket();
                newBasket.setItem(item);
                newBasket.setQuantity(quantity);
                em.persist(newBasket);
            }

            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw e;
        } finally {
            em.close();
        }
    }

    public void sellItem(String item, int quantity) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();

            // Wyszukaj istniejący rekord w koszyku na podstawie item
            Basket existingBasket = em.createQuery("SELECT b FROM Basket b WHERE b.item = :item", Basket.class)
                    .setParameter("item", item)
                    .getResultStream()
                    .findFirst()
                    .orElse(null);

            if (existingBasket != null) {
                int newQuantity = existingBasket.getQuantity() - quantity;

                if (newQuantity > 0) {
                    // Jeśli nowa ilość jest większa od 0, zaktualizuj rekord
                    existingBasket.setQuantity(newQuantity);
                    em.merge(existingBasket);
                } else {
                    // Jeśli nowa ilość jest mniejsza lub równa 0, usuń rekord
                    em.remove(existingBasket);
                }

                em.getTransaction().commit();
            } else {
                // Jeśli nie ma takiego przedmiotu w koszyku, rzuć wyjątek
                em.getTransaction().rollback();
                throw new IllegalArgumentException("Item not found in basket");
            }
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw e;
        } finally {
            em.close();
        }
    }

    public List<Basket> getAllItems() {
        EntityManager em = emf.createEntityManager();
        List<Basket> items;
        try {
            items = em.createQuery("SELECT b FROM Basket b", Basket.class).getResultList();
        } finally {
            em.close();
        }
        return items;
    }

    public void clearBasket() {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.createQuery("DELETE FROM Basket").executeUpdate();
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw e;
        } finally {
            em.close();
        }
    }
}
