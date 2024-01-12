package deim.urv.cat.homework2.model;

import java.io.Serializable;

public class RentalGameQuantity implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long id;
    private Rental rental;
    private Game game;
    private int quantity;

    public Rental getRental() {
        return rental;
    }

    public void setRental(Rental rental) {
        this.rental = rental;
    }

    public Game getGame() {
        return game;
    }

    public void setGame(Game game) {
        this.game = game;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
