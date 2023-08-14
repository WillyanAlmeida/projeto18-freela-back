import joi from "joi"

export const schemaNewservice = joi.object({
    name: joi.string().required(),
    description: joi.string().required(),
    url: joi.string().uri().required(),
    price: joi.number().required(),
    categoryId: joi.number().required(),
})


