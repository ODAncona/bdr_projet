<?php

class MenuItem {
    // private MenuItem $parent;
    // private int $level;
    // private string $name;

    public function __construct(public string $name,
                                public string $path, 
                                public int $position, 
                                public int $level
                                /*public MenuItem $parent*/) {}

    
    public function __toString() {
        return "<a href='$this->path' onclick='w3_close()' class='w3-bar-item w3-button w3-padding w3-text-teal'>$this->name </a>";
    }

}

class Menu {

    private array $items = array();

    public function putItem(MenuItem $item)
    {
        $this->items[] = $item;
    }

    public function __toString()
    {
        //$positions = array_column($this->items, 'position');
        //array_multisort($positions, SORT_ASC, $this->items);

        $out = "<div class='w3-bar-block'>";

        foreach ($this->items as $value) {
            $out .= $value;
        }

        $out .= "</div>";

        return $out;
    }
}