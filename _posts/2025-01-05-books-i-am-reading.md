---
title: Books I Am Reading
date: 2025-01-05
categories: [Books]
pin: true
---

Below is a list of books I am currently reading. For a full list of books I've read and want to read, head on over to my [Hardcover page](https://hardcover.app/@coreycarvalho).

This page is updated automagically. If you are interested in how this is done, you can view (and use) the code [here](https://github.com/coreycarvalho/ponderingpen.ink/blob/main/hardcover_fetcher.rb).
<div class="books-page">

  <!-- Currently Reading Section -->
  <section class="currently-reading">
    <h1>Currently Reading</h1>
    <ul class="books-list">
      {% for book in site.data.hardcover_currently_reading %}
      <li class="book-item">
        {% if book.cached_image_url %}
          <img src="{{ book.cached_image_url }}" alt="Cover of {{ book.title }}" class="book-cover" loading="lazy" />
        {% else %}
          <img src="/assets/images/placeholder.jpg" alt="No cover available for {{ book.title }}" class="book-cover placeholder" />
        {% endif %}
        <div class="book-details">
          <h2>{{ book.title }}</h2>
          <p><strong>Pages:</strong> {{ book.pages }}</p>
          <p><strong>Release Date:</strong> {{ book.release_date | date: "%B %d, %Y" }}</p>
        </div>
      </li>
      {% endfor %}
    </ul>
  </section>

  <!-- Books Read in 2025 Section -->
  <section class="books-read-2025">
    <h1>Books Read in 2025</h1>
    <ul class="books-list">
      {% for book in site.data.hardcover_read %}
      <li class="book-item">
        {% if book.cached_image_url %}
          <img src="{{ book.cached_image_url }}" alt="Cover of {{ book.title }}" class="book-cover" loading="lazy" />
        {% else %}
          <img src="/assets/images/placeholder.jpg" alt="No cover available for {{ book.title }}" class="book-cover placeholder" />
        {% endif %}
        <div class="book-details">
          <h2>{{ book.title }}</h2>
          <p><strong>Pages:</strong> {{ book.pages }}</p>
          <p><strong>Release Date:</strong> {{ book.release_date | date: "%B %d, %Y" }}</p>
        </div>
      </li>
      {% endfor %}
    </ul>
  </section>

</div>

<style>
  .books-list {
    list-style: none;
    padding: 0;
  }
  .book-item {
    display: flex;
    align-items: flex-start;
    margin-bottom: 20px;
  }
  .book-cover {
    width: 100px;
    height: auto;
    margin-right: 20px;
    object-fit: cover;
    border: 1px solid #ddd;
    border-radius: 4px;
  }
  .book-cover.placeholder {
    background-color: #f0f0f0;
  }
  .book-details h2 {
    margin: 0 0 10px 0;
  }
  .book-details p {
    margin: 5px 0;
  }
  @media (max-width: 600px) {
    .book-item {
      flex-direction: column;
      align-items: center;
    }
    .book-cover {
      margin-right: 0;
      margin-bottom: 10px;
    }
  }
</style>
