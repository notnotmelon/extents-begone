data.raw["utility-constants"]["default"].default_pipeline_extent = 4000000

for entity_prototype in pairs(defines.prototypes.entity) do
    for _, entity in pairs(data.raw[entity_prototype] or {}) do
        local fluid_boxes = {}

        for _, fluid_box in pairs(entity.fluid_boxes or {}) do
            fluid_boxes[#fluid_boxes + 1] = fluid_box
        end

        if entity.fluid_box then
            fluid_boxes[#fluid_boxes + 1] = entity.fluid_box
        end

        if entity.input_fluid_box then
            fluid_boxes[#fluid_boxes + 1] = entity.input_fluid_box
        end

        if entity.output_fluid_box then
            fluid_boxes[#fluid_boxes + 1] = entity.output_fluid_box
        end

        if entity.fuel_fluid_box then
            fluid_boxes[#fluid_boxes + 1] = entity.fuel_fluid_box
        end

        if entity.oxidizer_fluid_box then
            fluid_boxes[#fluid_boxes + 1] = entity.oxidizer_fluid_box
        end

        if entity.energy_source and entity.energy_source.type == "fluid" then
            fluid_boxes[#fluid_boxes + 1] = entity.energy_source.fluid_box
        end

        for _, fluid_box in pairs(fluid_boxes) do
            if type(fluid_box) == "table" then
                fluid_box.max_pipeline_extent = nil
            end
        end
    end
    ::continue::
end