/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package deim.urv.cat.homework2.model;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Cart {
    private List<Game> games = new ArrayList<>();

    public List<Game> getGames() {
        return games;
    }

    public void addGame(Game game) {
        games.add(game);
    }

    public void removeGame(Long gameId) {
        Iterator<Game> iterator = games.iterator();
        while (iterator.hasNext()) {
            Game game = iterator.next();
            if (game.getId().equals(gameId)) {
                iterator.remove();
                return;
            }
        }
    }

    public void clearCart() {
        games.clear();
    }
    
    public Game getGame(int index) {
        if (index >= 0 && index < games.size()) {
            return games.get(index);
        } else {
            return null;
        }
    }
    
    public List<Game> getGame() {
        return games;
    }
}