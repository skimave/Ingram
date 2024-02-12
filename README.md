# Ingram

This is a work in progress image hosting microservice that is intended to be used with the Palaver IRC client's own image upload functionality. This is therefore meant to those who prefer to use something else than provided Imgur or CloudApp functionality for uploading images but want to still use the IRC client's own functionality for uploads.

## Deployment

1. Clone the repository and set the values in config.py based on the template config file. The `SECRET_URL_PATH` should be something long and secure and will be essential for image uploads. Later on more about that.
2. Deploy the application. Personally I use systemd, nginx and gunicorn to host this.
3. Test (e.g. with Insomnia/Postman) that your deployment works, and then continue setting up the client on your phone. You need to use the /set -commands to configure the image provider:

### Setting `ui.image_service`

The `ui.image_service` setting needs to know the full path where the images are going to be uploaded. Let's assume that the app is deployed at `https://example.com` and you set the `SECRET_URL_PATH` to `naipuutueklusokla`. The full path would then be `https://example.com/naipuutueklusokla/image.jpeg`, and the command configure would be: `/set ui.image_service put https://example.com/naipuutueklusokla/image.jpeg.`

This should be entered into any open text field in the Palaver app. After this, you should be able to upload images and after a successful upload, have a link to the image inserted to an open text field.

Filenames of the resulting uploaded images will be randomized.

### About image expiration / `DAYS_OLD`

`DAYS_OLD` variable is being used to determine if a file on the uploads folder is old enough for removal. I have no intention on removing this automatical deletion functionality so far since it's a good security practice that files shareable with a link are terminated eventually.

## Why it's implemented like this?

Because of the limitations of the client:

1. Only HTTP PUT is supported as the only custom upload method
2. Authorization headers seem to get lost sometimes by the application. This is why a long secret URL is used instead of passwords
3. Palaver is pretty strict with paths used
4. It's still nice to be able to upload memes and photos instantly. Better than nothing right?