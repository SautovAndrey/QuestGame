package org.example.model;

public class Player {
    private final String name;
    private final String ipAddress;
    private int gamesPlayed;

    public Player(String name, String ipAddress) {
        this.name = name;
        this.ipAddress = ipAddress;
        this.gamesPlayed = 0;
    }

    public String getName() {
        return name;
    }

    public String getIpAddress() {
        return ipAddress;
    }

    public int getGamesPlayed() {
        return gamesPlayed;
    }

    public void incrementGamesPlayed() {
        this.gamesPlayed++;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;

        Player player = (Player) obj;

        if (!name.equals(player.name)) return false;
        return ipAddress.equals(player.ipAddress);
    }

    @Override
    public int hashCode() {
        int result = name.hashCode();
        result = 31 * result + ipAddress.hashCode();
        return result;
    }

    @Override
    public String toString() {
        return "Player{" +
                "name='" + name + '\'' +
                ", ipAddress='" + ipAddress + '\'' +
                ", gamesPlayed=" + gamesPlayed +
                '}';
    }
}

