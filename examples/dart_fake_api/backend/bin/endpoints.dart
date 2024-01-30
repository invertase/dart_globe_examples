import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'helpers.dart';
import 'utils.dart';

Response rootHandler(Request req) {
  return Response.ok(
    homepageTemplate,
    headers: {'Content-Type': 'text/html'},
  );
}

Response getRequestData(Request request) {
  final countryHeader = request.headers['x-globe-country'];
  return Response.ok(
    jsonEncode({'country': countryHeader}),
    headers: {
      'Content-Type': 'application/json',
    },
  );
}

// User resource
Response getUsers(Request request) => getList(request, users);
Response getUserById(Request request) => getItemById(request, users, 'User');
Future<Response> addUser(Request request) => addItem(request, users, 'User');
Future<Response> updateUser(Request request) =>
    updateItem(request, users, 'User');
Response deleteUser(Request request) => deleteItem(request, users, 'User');

// Company resource
Response getCompanies(Request request) => getList(request, companies);
Response getCompanyById(Request request) =>
    getItemById(request, companies, 'Company');
Future<Response> addCompany(Request request) =>
    addItem(request, companies, 'Company');
Future<Response> updateCompany(Request request) =>
    updateItem(request, companies, 'Company');
Response deleteCompany(Request request) =>
    deleteItem(request, companies, 'Company');

// Todos endpoints
Response getTodos(Request request) => getList(request, todos);
Response getTodoById(Request request) => getItemById(request, todos, 'Todo');
Future<Response> addTodo(Request request) => addItem(request, todos, 'Todo');
Future<Response> updateTodo(Request request) =>
    updateItem(request, todos, 'Todo');
Response deleteTodo(Request request) => deleteItem(request, todos, 'Todo');

// Categories endpoints
Response getCategories(Request request) => getList(request, categories);
Response getCategoryById(Request request) =>
    getItemById(request, categories, 'Category');
Future<Response> addCategory(Request request) =>
    addItem(request, categories, 'Category');
Future<Response> updateCategory(Request request) =>
    updateItem(request, categories, 'Category');
Response deleteCategory(Request request) =>
    deleteItem(request, categories, 'Category');

// albums endpoints
Response getAlbums(Request request) => getList(request, albums);
Response getAlbumById(Request request) => getItemById(request, albums, 'Album');
Future<Response> addAlbum(Request request) => addItem(request, albums, 'Album');
Future<Response> updateAlbum(Request request) =>
    updateItem(request, albums, 'Album');
Response deleteAlbum(Request request) => deleteItem(request, albums, 'Album');

// photos endpoints
Response getPhotos(Request request) => getList(request, photos);
Response getPhotoById(Request request) => getItemById(request, photos, 'Photo');
Future<Response> addPhoto(Request request) => addItem(request, photos, 'Photo');
Future<Response> updatePhoto(Request request) =>
    updateItem(request, photos, 'Photo');
Response deletePhoto(Request request) => deleteItem(request, photos, 'Photo');

// posts endpoints
Response getPosts(Request request) => getList(request, posts);
Response getPostById(Request request) => getItemById(request, posts, 'Post');
Future<Response> addPost(Request request) => addItem(request, posts, 'Post');
Future<Response> updatePost(Request request) =>
    updateItem(request, posts, 'Post');
Response deletePost(Request request) => deleteItem(request, posts, 'Post');

// products endpoints
Response getProducts(Request request) => getList(request, products);
Response getProductById(Request request) =>
    getItemById(request, products, 'Product');
Future<Response> addProduct(Request request) =>
    addItem(request, products, 'Product');
Future<Response> updateProduct(Request request) =>
    updateItem(request, products, 'Product');
Response deleteProduct(Request request) =>
    deleteItem(request, products, 'Product');

// cart endpoints
Response getCarts(Request request) => getList(request, carts);
Response getCartById(Request request) => getItemById(request, carts, 'Cart');
Future<Response> addCart(Request request) => addItem(request, carts, 'Cart');
Future<Response> updateCart(Request request) =>
    updateItem(request, carts, 'Cart');
Response deleteCart(Request request) => deleteItem(request, carts, 'Cart');

// animals endpoints
Response getAnimals(Request request) => getList(request, animals);
Response getAnimalById(Request request) =>
    getItemById(request, animals, 'Animal');
Future<Response> addAnimal(Request request) =>
    addItem(request, animals, 'Animal');
Future<Response> updateAnimal(Request request) =>
    updateItem(request, animals, 'Animal');
Response deleteAnimal(Request request) =>
    deleteItem(request, animals, 'Animal');
