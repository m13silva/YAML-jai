#import "Basic";
#import "String";
#import "File";
yaml :: #import,file "module.jai";

Direction :: enum {
    NORTH;
    SOUTH;
    EAST;
    WEST;
}

Stats :: struct {
    facing: Direction;
    scores: [3] int;
    display_name: string;
    @YamlName(nickname)
}

Vec3 :: struct {
    x, y, z: float32;
}

Item :: struct {
    name:  string;
    count: s32;
}

Player :: struct {
    name:     string;
    level:    s32;
    health:   float32;
    position: Vec3;
    items:    [..] Item;
}

main :: () {
    s := Stats.{
        facing=.EAST,
        scores = int.[10,50,80],
        display_name = "Captain",
    };

    if yaml.serializer("stats.yaml", s) {
        print("Saved stats.yaml\n");
    }

    loaded, ok := yaml.deserializer("stats.yaml", Stats);
    if ok {
        print("facing=%, scores=%, display_name=%\n", loaded.facing, loaded.scores, loaded.display_name);
    }

    p := Player.{
        name     = "Aria",
        level    = 12,
        health   = 87.5,
        position = Vec3.{ x = 10.0, y = 0.0, z = -3.5 },
    };
    array_add(*p.items, Item.{ name = "Espada", count = 1 });
    array_add(*p.items, Item.{ name = "Pocion", count = 3 });

    if yaml.serializer("player.yaml", p) {
        print("Saved player.yaml\n");
    }

    loaded_p, ok_p := yaml.deserializer("player.yaml", Player);
    if ok_p {
        print("name=%, level=%, health=%\n", loaded_p.name, loaded_p.level, loaded_p.health);
        print("position=(%, %, %)\n", loaded_p.position.x, loaded_p.position.y, loaded_p.position.z);
        for loaded_p.items print("item: % x%\n", it.name, it.count);
    }
}
