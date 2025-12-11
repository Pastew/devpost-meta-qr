// Find all links starting with the Meta Horizon URL
const links = document.querySelectorAll('a[href^="https://horizon.meta.com/world/"]');

links.forEach(link => {
    // Create a container for the QR code
    const container = document.createElement('div');
    container.style.marginTop = '10px';
    container.style.marginBottom = '20px';

    // Insert the container after the link
    link.parentNode.insertBefore(container, link.nextSibling);

    // Generate the QR code
    // Ensure QRCode is loaded
    if (typeof QRCode !== 'undefined') {
        new QRCode(container, {
            text: link.href,
            width: 128,
            height: 128
        });
    } else {
        console.error('QRCode library not loaded.');
    }

});
