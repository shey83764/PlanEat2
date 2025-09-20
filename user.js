import express from "express";
import { savePerfilUsuario } from "../controllers/userController";

const router = express.Router();

// POST /api/users/perfil
router.post("/perfil", savePerfilUsuario);

export default router;
