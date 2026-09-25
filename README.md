# YAML-jai

YAML serialization and deserialization for Jai using [libyaml](https://github.com/yaml/libyaml).

> [!WARNING]
> Windows only
> This library currently supports Windows only.

## Features

* Serialize Jai structs to YAML
* Deserialize YAML into Jai structs
* Nested structs
* Fixed and dynamic arrays
* Enums
* Strings, integers and floating-point values
* Custom YAML field names with `@YamlName`

## Example

```jai
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

main :: () {
    stats := Stats.{
        facing = .EAST,
        scores = int.[10, 50, 80],
        display_name = "Captain",
    };

    if yaml.serializer("stats.yaml", stats) {
        print("Saved stats.yaml\n");
    }

    loaded, ok := yaml.deserializer("stats.yaml", Stats);
    if ok {
        print("facing=%, scores=%, display_name=%\n",
            loaded.facing,
            loaded.scores,
            loaded.display_name);
    }
}
```

This produces:

```yaml
facing: EAST
scores:
- 10
- 50
- 80
nickname: Captain
```

## Nested structs and arrays

```jai
Vec3 :: struct {
    x, y, z: float32;
}

Item :: struct {
    name: string;
    count: s32;
}

Player :: struct {
    name: string;
    level: s32;
    health: float32;
    position: Vec3;
    items: [..] Item;
}
```

A `Player` can be serialized and deserialized directly:

```jai
yaml.serializer("player.yaml", player);

loaded, ok := yaml.deserializer("player.yaml", Player);
```

## API

### `yaml.serializer`

```jai
yaml.serializer(path, value)
```

Serializes a Jai value to a YAML file.

### `yaml.deserializer`

```jai
value, ok := yaml.deserializer(path, Type)
```

Deserializes a YAML file into the specified Jai type.

### `@YamlName`

Use `@YamlName` to customize the YAML field name:

```jai
Stats :: struct {
    display_name: string;
    @YamlName(nickname)
}
```

The field is serialized as:

```yaml
nickname: Captain
```

## Dependencies

* [Jai](https://www.jai.community/)
* [libyaml](https://github.com/yaml/libyaml)

## License

See the `LICENSE` file.
