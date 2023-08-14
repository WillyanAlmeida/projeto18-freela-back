import joi from "joi"

export const schemasignup = joi.object({
    name: joi.string().required(),
    email: joi.string().email().required(),
    password: joi.string().min(5).required(),
    confirmPassword: joi.ref('password'),
    city: joi.string().required(),
    phone: joi.string().min(10).max(11).pattern(/^[0-9]+$/).required(),
    zipcode: joi.string().min(8).required().pattern(/^[0-9]+$/),
    cpf: joi.string().length(11).pattern(/^[0-9]+$/).required(),
    picture: joi.string().uri().required()
})

export const schemasignin = joi.object({
    email: joi.string().email().required(),
    password: joi.string().min(3)
})

