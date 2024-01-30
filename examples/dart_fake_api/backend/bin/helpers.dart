import 'package:faker_dart/faker_dart.dart';

final faker = Faker.instance;

var users = generateUsers(1000);
var companies = generateCompanies(100);
var todos = generateTodos(200);
var categories = generateCategories(10);
var commits = generateCommits(2000);
var posts = generatePosts(1000);
var albums = generateAlbums(20);
var photos = generatePhotos(2000);
var products = generateProducts(1000);
var carts = generateCarts(40);
var animals = generateAnimals(500);

var currentLocale = 'en';

void setCustomLocale(String country) {
  final locale = FakerLocaleType.values.firstWhere(
    (e) => e.name.toLowerCase().contains(country.toLowerCase()),
  );
  if (currentLocale == locale.name) return;
  faker.setLocale(locale);
  currentLocale = locale.name;
  users = generateUsers(1000);
  companies = generateCompanies(100);
  todos = generateTodos(200);
  categories = generateCategories(10);
  commits = generateCommits(2000);
  posts = generatePosts(1000);
  albums = generateAlbums(20);
  photos = generatePhotos(2000);
  products = generateProducts(1000);
  carts = generateCarts(40);
  animals = generateAnimals(500);
}

Map<String, dynamic> createCompany() {
  return {
    'id': faker.datatype.uuid(),
    'name': faker.company.companyName(),
    'description': faker.company.catchPhrase(),
    'image': faker.image.image(),
    'createdAt': faker.date.past(DateTime.now()).toString(),
    'updatedAt': faker.date.past(DateTime.now()).toString(),
  };
}

List<Map<String, dynamic>> generateCompanies(int count) {
  return List.generate(count, (_) => createCompany());
}

Map<String, dynamic> createUser() {
  return {
    'id': faker.datatype.uuid(),
    'firstName': faker.name.firstName(),
    'lastName': faker.name.lastName(),
    'email': faker.internet.email(),
    'address': faker.address.streetAddress(),
    'bio': faker.lorem.sentence(),
    'phone': faker.phoneNumber.phoneNumber(),
    'image': faker.image.image(),
    'company': faker.company.companyName(),
    'job': faker.name.jobTitle(),
    'website': faker.internet.url(),
    'createdAt': faker.date.past(DateTime.now()).toString(),
    'updatedAt': faker.date.past(DateTime.now()).toString(),
  };
}

List<Map<String, dynamic>> generateUsers(int count) {
  return List.generate(count, (_) => createUser());
}

Map<String, dynamic> createTodo() {
  return {
    'userId': faker.datatype.uuid(),
    'id': faker.datatype.uuid(),
    'title': faker.lorem.sentence(),
    'description': faker.lorem.sentence(),
    'completed': faker.datatype.boolean(),
    'createdAt': faker.date.past(DateTime.now()).toString(),
    'updatedAt': faker.date.past(DateTime.now()).toString(),
  };
}

List<Map<String, dynamic>> generateTodos(int count) {
  return List.generate(count, (_) => createTodo());
}

Map<String, dynamic> createCategory() {
  return {
    'id': faker.datatype.uuid(),
    'name': faker.commerce.department(),
    'description': faker.commerce.productDescription(),
    'image': faker.image.image(),
    'createdAt': faker.date.past(DateTime.now()).toString(),
    'updatedAt': faker.date.past(DateTime.now()).toString(),
  };
}

List<Map<String, dynamic>> generateCategories(int count) {
  return List.generate(count, (_) => createCategory());
}

Map<String, dynamic> createCommit() {
  return {
    'id': faker.datatype.uuid(),
    'userId': faker.datatype.uuid(),
    'message': faker.git.commitMessage(),
    'sha': faker.git.commitSha(),
    'createdAt': faker.date.past(DateTime.now()).toString(),
    'updatedAt': faker.date.past(DateTime.now()).toString(),
  };
}

List<Map<String, dynamic>> generateCommits(int count) {
  return List.generate(count, (_) => createCommit());
}

Map<String, dynamic> createPost() {
  return {
    'id': faker.datatype.uuid(),
    'userId': faker.datatype.uuid(),
    'title': faker.lorem.sentence(),
    'description': faker.lorem.sentence(),
    'image': faker.image.image(),
    'createdAt': faker.date.past(DateTime.now()).toString(),
    'updatedAt': faker.date.past(DateTime.now()).toString(),
  };
}

List<Map<String, dynamic>> generatePosts(int count) {
  return List.generate(count, (_) => createPost());
}

Map<String, dynamic> createAlbum() {
  return {
    'id': faker.datatype.uuid(),
    'userId': faker.datatype.uuid(),
    'title': faker.lorem.sentence(),
    'description': faker.lorem.sentence(),
    'image': faker.image.image(),
    'createdAt': faker.date.past(DateTime.now()).toString(),
    'updatedAt': faker.date.past(DateTime.now()).toString(),
  };
}

List<Map<String, dynamic>> generateAlbums(int count) {
  return List.generate(count, (_) => createAlbum());
}

Map<String, dynamic> createPhoto() {
  return {
    'id': faker.datatype.uuid(),
    'albumId': faker.datatype.uuid(),
    'title': faker.lorem.sentence(),
    'description': faker.lorem.sentence(),
    'image': faker.image.image(),
    'createdAt': faker.date.past(DateTime.now()).toString(),
    'updatedAt': faker.date.past(DateTime.now()).toString(),
  };
}

List<Map<String, dynamic>> generatePhotos(int count) {
  return List.generate(count, (_) => createPhoto());
}

Map<String, dynamic> createProduct() {
  return {
    'id': faker.datatype.uuid(),
    'categoryId': faker.datatype.uuid(),
    'companyId': faker.datatype.uuid(),
    'name': faker.commerce.productName(),
    'description': faker.commerce.productDescription(),
    'image': faker.image.image(),
    'price': faker.commerce.price(),
    'quantity': faker.datatype.number(),
    'createdAt': faker.date.past(DateTime.now()).toString(),
    'updatedAt': faker.date.past(DateTime.now()).toString(),
  };
}

List<Map<String, dynamic>> generateProducts(int count) {
  return List.generate(count, (_) => createProduct());
}

Map<String, dynamic> createCart() {
  return {
    'id': faker.datatype.uuid(),
    'userId': faker.datatype.uuid(),
    'productId': faker.datatype.uuid(),
    'quantity': faker.datatype.number(),
    'createdAt': faker.date.past(DateTime.now()).toString(),
    'updatedAt': faker.date.past(DateTime.now()).toString(),
  };
}

List<Map<String, dynamic>> generateCarts(int count) {
  return List.generate(count, (_) => createCart());
}

Map<String, dynamic> createAnimal() {
  return {
    'id': faker.datatype.uuid(),
    'name': faker.animal.animal(),
    'type': faker.animal.type(),
    'description': faker.lorem.sentence(),
    'image': faker.image.image(),
    'createdAt': faker.date.past(DateTime.now()).toString(),
    'updatedAt': faker.date.past(DateTime.now()).toString(),
  };
}

List<Map<String, dynamic>> generateAnimals(int count) {
  return List.generate(count, (_) => createAnimal());
}

final homepageTemplate = '''
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>Fake REST API on Edge</title>
		<script src="https://cdn.tailwindcss.com"></script>
		<script>
			tailwind.config = {
				theme: {
					extend: {
						colors: {
							clifford: '#da373d',
						},
					},
				},
			};
		</script>
		<style>
			.response-box {
				background-color: #e0e0e0;
				margin-top: 20px;
				padding: 10px;
				width: 100%;
				height: auto;
				overflow: auto;
				white-space: pre-wrap;
			}
		</style>
	</head>
	<body class="bg-gray-100">
		<header class="bg-gray-800 text-white text-center p-8">
			<h1 class="text-5xl font-bold">
				Your REST API Assistant On Edge Written in Dart
			</h1>
		</header>
		<div class="container mx-auto mt-10">
			<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
				<div class="bg-white p-6 rounded-lg shadow-md">
					<h2 class="text-2xl font-bold mb-2">Running on Edge</h2>
					<p>Deployed globally for low-latency access anywhere.</p>
				</div>

				<div class="bg-white p-6 rounded-lg shadow-md">
					<h2 class="text-2xl font-bold mb-2">Extremely Fast</h2>
					<p>High-performance backend, optimized for speed.</p>
				</div>

				<div class="bg-white p-6 rounded-lg shadow-md">
					<h2 class="text-2xl font-bold mb-2">Written in Dart</h2>
					<p>Utilizing the robustness of the Dart language.</p>
				</div>

				<div class="bg-white p-6 rounded-lg shadow-md">
					<h2 class="text-2xl font-bold mb-2">Flutter Friendly</h2>
					<p>Designed to integrate seamlessly with Flutter apps.</p>
				</div>
			</div>
		</div>

		<div class="container mx-auto mt-10">
			<div class="flex flex-wrap md:flex-no-wrap">
				<div class="w-full md:w-1/2 px-2 mb-4">
					<h3 class="text-3xl font-bold text-center mb-4">Test It!</h3>
					<div id="country" class="m-2 p-2 border border-gray-300"></div>
					<div id="url"></div>
					<div class="text-center">
						<select
							id="endpointSelector"
							class="border border-gray-300 rounded p-2 mb-2 w-full">
							<option value="">Select an Endpoint</option>
							<option value="/api/v1/users">GET /api/v1/users</option>
							<option value="/api/v1/companies">GET /api/v1/companies</option>
							<option value="/api/v1/todos">GET /api/v1/todos</option>
							<option value="/api/v1/categories">GET /api/v1/categories</option>
							<option value="/api/v1/albums">GET /api/v1/albums</option>
							<option value="/api/v1/photos">GET /api/v1/photos</option>
							<option value="/api/v1/posts">GET /api/v1/posts</option>
							<option value="/api/v1/products">GET /api/v1/products</option>
							<option value="/api/v1/carts">GET /api/v1/carts</option>
							<option value="/api/v1/animals">GET /api/v1/animals</option>
						</select>

						<input
							type="number"
							id="limit"
							placeholder="Limit (Optional)"
							class="border border-gray-300 rounded p-2 mb-2 w-full" />
						<input
							type="number"
							id="skip"
							placeholder="Skip (Optional)"
							class="border border-gray-300 rounded p-2 mb-2 w-full" />

						<select
							id="localeSelector"
							class="border border-gray-300 rounded p-2 mb-2 w-full">
							<option value="">Select Locale (Optional)</option>
							<option value="az">az</option>
							<option value="ar">ar</option>
							<option value="cz">cz</option>
							<option value="de">de</option>
							<option value="de_AT">de_AT</option>
							<option value="de_CH">de_CH</option>
							<option value="en">en</option>
							<option value="en_AU">en_AU</option>
							<option value="en_AU_ocker">en_AU_ocker</option>
							<option value="en_BORK">en_BORK</option>
							<option value="en_CA">en_CA</option>
							<option value="en_GB">en_GB</option>
							<option value="en_IE">en_IE</option>
							<option value="en_IND">en_IND</option>
							<option value="en_US">en_US</option>
							<option value="en_ZA">en_ZA</option>
							<option value="es">es</option>
							<option value="es_MX">es_MX</option>
							<option value="fa">fa</option>
							<option value="fi">fi</option>
							<option value="fr">fr</option>
							<option value="fr_CA">fr_CA</option>
							<option value="fr_CH">fr_CH</option>
							<option value="ge">ge</option>
							<option value="hy">hy</option>
							<option value="hr">hr</option>
							<option value="id_ID">id_ID</option>
							<option value="it">it</option>
							<option value="ja">ja</option>
							<option value="ko">ko</option>
							<option value="nb_NO">nb_NO</option>
							<option value="ne">ne</option>
							<option value="nl">nl</option>
							<option value="nl_BE">nl_BE</option>
							<option value="pl">pl</option>
							<option value="pt_BR">pt_BR</option>
							<option value="pt_PT">pt_PT</option>
							<option value="ro">ro</option>
							<option value="ru">ru</option>
							<option value="sk">sk</option>
							<option value="sv">sv</option>
							<option value="tr">tr</option>
							<option value="uk">uk</option>
							<option value="vi">vi</option>
							<option value="zh_CN">zh_CN</option>
							<option value="zh_TW">zh_TW</option>
						</select>

						<button
							onclick="fetchData()"
							class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded w-full">
							Fetch Data
						</button>
					</div>
				</div>
				<div class="w-full md:w-1/2 px-2">
					<h3 class="text-3xl font-bold text-center mb-4">Response</h3>
					<div
						class="response-box mx-auto p-4 border border-gray-300 rounded"
						id="apiResponse"></div>
				</div>
			</div>
		</div>

		<div class="container mx-auto mt-10">
			<div
				id="apiEndpoints"
				class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4"></div>
		</div>

		<footer class="bg-gray-800 text-white text-center p-8 mt-10">
			<p class="text-xl mt-4">Hosted on globe.dev by Invertase</p>
		</footer>

		<script>
			function fetchCountry() {
				var url = new URL(window.location.origin + '/api/v1/requestData');
				fetch(url)
					.then((response) => response.json())
					.then((data) => {
            if(data.country){
              document.getElementById(
                'country'
              ).innerHTML = `Your visiting from <b>\${data.country}</b>, therefore your locale has been set to match your country language!.`;
            }
					})
					.catch((error) => {
						document.getElementById('country').textContent = 'Error: ' + error;
					});
			}
			function fetchData() {
				var endpoint = document.getElementById('endpointSelector').value;
				var limit = document.getElementById('limit').value;
				var skip = document.getElementById('skip').value;
				var locale = document.getElementById('localeSelector').value;

				if (endpoint) {
					var url = new URL(window.location.origin + endpoint);
					if (limit) url.searchParams.append('limit', limit);
					if (skip) url.searchParams.append('skip', skip);
					if (locale) url.searchParams.append('locale', locale);

					document.getElementById('url').innerHTML = url;

					fetch(url)
						.then((response) => response.json())
						.then((data) => {
							document.getElementById('apiResponse').textContent =
								JSON.stringify(data, null, 2);
						})
						.catch((error) => {
							document.getElementById('apiResponse').textContent =
								'Error: ' + error;
						});
				} else {
					document.getElementById('apiResponse').textContent =
						'Please select an endpoint';
				}
			}
			// Define your endpoints
			function createCrudEndpoints(resource) {
				return [
					{
						method: 'GET',
						path: `/api/v1/\${resource}`,
						description: `Retrieve a list of \${resource}`,
					},
					{
						method: 'POST',
						path: `/api/v1/\${resource}`,
						description: `Create a new \${resource.slice(0, -1)}`,
					},
					{
						method: 'PUT',
						path: `/api/v1/\${resource}/{id}`,
						description: `Update a \${resource.slice(0, -1)}`,
					},
					{
						method: 'DELETE',
						path: `/api/v1/\${resource}/{id}`,
						description: `Delete a \${resource.slice(0, -1)}`,
					},
				];
			}

			const apiData = {
				Users: createCrudEndpoints('users'),
				Companies: createCrudEndpoints('companies'),
				Todos: createCrudEndpoints('todos'),
				Categories: createCrudEndpoints('categories'),
				Albums: createCrudEndpoints('albums'),
				Photos: createCrudEndpoints('photos'),
				Posts: createCrudEndpoints('posts'),
				Products: createCrudEndpoints('products'),
				Carts: createCrudEndpoints('carts'),
				Animals: createCrudEndpoints('animals'),
				// Add more categories as needed
			};

			// Function to get color based on HTTP method
			function getColor(method) {
				switch (method) {
					case 'GET':
						return 'bg-green-500';
					case 'POST':
						return 'bg-blue-500';
					case 'PUT':
						return 'bg-yellow-500';
					case 'DELETE':
						return 'bg-red-500';
					default:
						return 'bg-gray-500';
				}
			}

			// Function to generate the UI
			function generateEndpointsUI() {
				const container = document.getElementById('apiEndpoints');
				container.innerHTML = '';
				for (const category in apiData) {
					let categoryContent = `<div class="bg-white p-6 rounded-lg shadow-md"><h4 class="text-2xl font-bold mb-2">\${category}</h4>`;
					apiData[category].forEach((endpoint) => {
						const methodColor = getColor(endpoint.method);
						categoryContent += `
                    <div class="mb-2">
                        <span class="inline-block \${methodColor} text-white px-2 py-1 rounded">\${endpoint.method}</span>
                        <span>\${endpoint.path}</span> - \${endpoint.description}
                    </div>
                `;
					});
					categoryContent += `</div>`;
					container.innerHTML += categoryContent;
				}
			}

			window.onload = function () {
				fetchCountry();
				generateEndpointsUI();
			};
		</script>
	</body>
</html>
''';
