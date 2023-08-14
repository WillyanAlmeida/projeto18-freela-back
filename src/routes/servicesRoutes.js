import { Router } from "express";
import { validateSchema } from "../middlewares/validateSchema.js";
import { NewService, availableservice, getCategorys, getMyservices, getServiceId, getServicesAll } from "../controllers/ServicesController.js";
import { validateAuth } from "../middlewares/validateAuth.js";
import { schemaNewservice } from "../schemas/ServiceSchemas.js";



const servicesRouter = Router()


servicesRouter.get("/categorys", getCategorys);
servicesRouter.post("/new-service", validateAuth, validateSchema(schemaNewservice), NewService);
servicesRouter.get("/my-service", validateAuth, getMyservices);
servicesRouter.patch("/my-service/:id", validateAuth, availableservice);
servicesRouter.get("/", getServicesAll);
servicesRouter.get("/service/:id", getServiceId);






export default servicesRouter