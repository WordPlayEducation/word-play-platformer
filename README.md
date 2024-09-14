# Type Structure

ALSO all prompts, regardless of type, have these parameters:

"color": string (#FFFFFF), <- Optional
"sub_color": string (#FFFFFF) <- Optional [like, if an object has 2 colors... its ok if this one doesnt work well]
"size": string ... must be either ("wide", "tall", "small", "big")

## Fluids

response = {
    "type": "fluid",
    "text": string,
    "dynamic": float ([0, 1]), <- Optional [like, how expressive the word]

}

## Inanimate Solids

response = {
    "type": "inanimate_solid",
    "text": string,
    "dynamic": float ([0, 1]), <- Optional
    "physics_type": string ("mobile" | "rigid") [rigid are thiings like brick, rocks, house ... immovable objects in games; mobile are things you can push, like a bottle or something small]
}

## Life

response = {
    "type": "life",
    "text": string,
    "dynamic": float ([0, 1]), <- Optional
    "movement_type": string ("land", "air", "fluid"),
    "activity": float ([0, 1])
}
