# Type Structure

## Fluids

response = {
    "type": "fluid",
    "text": string,
    "dynamic": float ([0, 1]), <- Optional
    "color": string (#FFFFFF), <- Optional
    "sub_color": string (#FFFFFF) <- Optional
}

## Inanimate Solids

response = {
    "type": "inanimate_solid",
    "text": string,
    "dynamic": float ([0, 1]), <- Optional
    "color": string (#FFFFFF), <- Optional
    "sub_color": string (#FFFFFF), <- Optional
    "physics_type": string ("mobile" | "rigid")
}

## Life

response = {
    "type": "life",
    "text": string,
    "dynamic": float ([0, 1]), <- Optional
    "color": string (#FFFFFF), <- Optional
    "sub_color": string (#FFFFFF), <- Optional
    "movement_type": string ("land", "air", "fluid"),
    "activity": float ([0, 1])
}
