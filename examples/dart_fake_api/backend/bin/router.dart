// ignore: constant_identifier_names
import 'package:shelf_router/shelf_router.dart';

import 'endpoints.dart';

// ignore: constant_identifier_names
const CURRENT_VERSION = 'v1';
// ignore: constant_identifier_names
const NEXT_VERSION = 'v2';

// Configure routes.
final router = Router()
  ..get('/', rootHandler)
  ..get('/api/$CURRENT_VERSION/requestData', getRequestData)
  // Users routes
  ..get('/api/$CURRENT_VERSION/users', getUsers)
  ..get('/api/$CURRENT_VERSION/users/<id>', getUserById)
  ..post('/api/$CURRENT_VERSION/users', addUser)
  ..put('/api/$CURRENT_VERSION/users/<id>', updateUser)
  ..delete('/api/$CURRENT_VERSION/users/<id>', deleteUser)

  // Companies routes
  ..get('/api/$CURRENT_VERSION/companies', getCompanies)
  ..get('/api/$CURRENT_VERSION/companies/<id>', getCompanyById)
  ..post('/api/$CURRENT_VERSION/companies', addCompany)
  ..put('/api/$CURRENT_VERSION/companies/<id>', updateCompany)
  ..delete('/api/$CURRENT_VERSION/companies/<id>', deleteCompany)

  // Todo routes
  ..get('/api/$CURRENT_VERSION/todos', getTodos)
  ..get('/api/$CURRENT_VERSION/todos/<id>', getTodoById)
  ..post('/api/$CURRENT_VERSION/todos', addTodo)
  ..put('/api/$CURRENT_VERSION/todos/<id>', updateTodo)
  ..delete('/api/$CURRENT_VERSION/todos/<id>', deleteTodo)

  // Categories routes
  ..get('/api/$CURRENT_VERSION/categories', getCategories)
  ..get('/api/$CURRENT_VERSION/categories/<id>', getCategoryById)
  ..post('/api/$CURRENT_VERSION/categories', addCategory)
  ..put('/api/$CURRENT_VERSION/categories/<id>', updateCategory)
  ..delete('/api/$CURRENT_VERSION/categories/<id>', deleteCategory)

  // Albums routes
  ..get('/api/$CURRENT_VERSION/albums', getAlbums)
  ..get('/api/$CURRENT_VERSION/albums/<id>', getAlbumById)
  ..post('/api/$CURRENT_VERSION/albums', addAlbum)
  ..put('/api/$CURRENT_VERSION/albums/<id>', updateAlbum)
  ..delete('/api/$CURRENT_VERSION/albums/<id>', deleteAlbum)

  // Photos routes
  ..get('/api/$CURRENT_VERSION/photos', getPhotos)
  ..get('/api/$CURRENT_VERSION/photos/<id>', getPhotoById)
  ..post('/api/$CURRENT_VERSION/photos', addPhoto)
  ..put('/api/$CURRENT_VERSION/photos/<id>', updatePhoto)
  ..delete('/api/$CURRENT_VERSION/photos/<id>', deletePhoto)

  // Posts routes
  ..get('/api/$CURRENT_VERSION/posts', getPosts)
  ..get('/api/$CURRENT_VERSION/posts/<id>', getPostById)
  ..post('/api/$CURRENT_VERSION/posts', addPost)
  ..put('/api/$CURRENT_VERSION/posts/<id>', updatePost)
  ..delete('/api/$CURRENT_VERSION/posts/<id>', deletePost)

  // Products routes
  ..get('/api/$CURRENT_VERSION/products', getProducts)
  ..get('/api/$CURRENT_VERSION/products/<id>', getProductById)
  ..post('/api/$CURRENT_VERSION/products', addProduct)
  ..put('/api/$CURRENT_VERSION/products/<id>', updateProduct)
  ..delete('/api/$CURRENT_VERSION/products/<id>', deleteProduct)

  // Carts routes
  ..get('/api/$CURRENT_VERSION/carts', getCarts)
  ..get('/api/$CURRENT_VERSION/carts/<id>', getCartById)
  ..post('/api/$CURRENT_VERSION/carts', addCart)
  ..put('/api/$CURRENT_VERSION/carts/<id>', updateCart)
  ..delete('/api/$CURRENT_VERSION/carts/<id>', deleteCart)

  // Animals routes
  ..get('/api/$CURRENT_VERSION/animals', getAnimals)
  ..get('/api/$CURRENT_VERSION/animals/<id>', getAnimalById)
  ..post('/api/$CURRENT_VERSION/animals', addAnimal)
  ..put('/api/$CURRENT_VERSION/animals/<id>', updateAnimal)
  ..delete('/api/$CURRENT_VERSION/animals/<id>', deleteAnimal);
