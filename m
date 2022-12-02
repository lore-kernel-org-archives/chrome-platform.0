Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721AD7B
	for <chrome-platform@lists.linux.dev>; Fri,  2 Dec 2022 04:53:20 +0000 (UTC)
Received: by mail-vk1-f181.google.com with SMTP id b81so1824794vkf.1
        for <chrome-platform@lists.linux.dev>; Thu, 01 Dec 2022 20:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Mo/Jzmj97699FgsVRo9A86tN5cGByg6vtV/IG9s+9pg=;
        b=dCXDQdIIYmKKBL8B+e5zAeamhBp/z/6Kx8FkljUP1lVX3OoYJ+mO0JpwQXrre1qPBl
         cljb4UmEcD+6a58p+AyRqoMZzlIYrg6s5yCersKax9MJOEaYPA2IrfkN0iD0RGf8oOFK
         ZydwDyZIy3cNDaoFqzsDu1aPyJRI1Low86e94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mo/Jzmj97699FgsVRo9A86tN5cGByg6vtV/IG9s+9pg=;
        b=NdVLAHr4PfPE/8+us6XkamcdLbQaZFzffYiYW003jVEwdXjSJ50c3a7fQHik+y/KT6
         6ypGU1YU0J63xBuJcVNni2AJyUfsQr99Kkuxs4PIV9N9Pt52UrqDJt3fOII674tg/T7o
         62qV9+apLqIEVU1aVvrvaKoTDIlVrapA02Jg0vgg1n1gzZA6xxlgBWnJTRPk0oHvgP5k
         XfVOOYCVYqQiSNF1z5pdhthCJClXFYbhv9ZcVcIxhXYKemQ5FNDBfVa1RNhNCI4upOlp
         GtnjEF1FjxR6igb2mW+aEZseVRiqFoL13hd2Vhjs676Q9UIvbEnhdhqsvw5eGBDvyVy7
         cLtQ==
X-Gm-Message-State: ANoB5pmIM+PUR4nW3DUHGvRvAzJ0U2gt/eJZiOgWzgIOATbta2EONaeJ
	SGca1AWsHF6eHKGc9oXpgUmRGi31NJ7z0GIErbrmeg==
X-Google-Smtp-Source: AA0mqf70jBsrJPWXLS/68AGUc508wiotE9Jhx8V/d9D4GSUqZHrVHwjsa4fIBNevkAUjSD378eCDts+iU6XdDanz5b4=
X-Received: by 2002:a05:6122:c77:b0:3bd:4b97:a4fa with SMTP id
 i55-20020a0561220c7700b003bd4b97a4famr2786758vkr.7.1669956799411; Thu, 01 Dec
 2022 20:53:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221130131245.v8.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
 <CACeCKacHWPVv=sDo5-VjpckvvFw6YmqvXCyLqzgbXBmG080mmw@mail.gmail.com> <CACeCKafaZNqtKb8=thALgX4yaVTqsPcGQsHEKUZEVB0XWaNMKg@mail.gmail.com>
In-Reply-To: <CACeCKafaZNqtKb8=thALgX4yaVTqsPcGQsHEKUZEVB0XWaNMKg@mail.gmail.com>
From: Mark Hasemeyer <markhas@chromium.org>
Date: Thu, 1 Dec 2022 21:53:08 -0700
Message-ID: <CANg-bXAO59iDV-KNzCk=o6jTtPRRGho5an=mp4Y5jcZsmd33Gw@mail.gmail.com>
Subject: Re: [PATCH v8 1/3] platform/chrome: cros_ec_uart: Add cros-ec-uart
 transport layer
To: Prashant Malani <pmalani@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Raul Rangel <rrangel@chromium.org>, 
	Bhanu Prakash Maiya <bhanumaiya@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> +               /* Received bytes are more the allocated buffer*/
> +               ec_uart->response.error = -EMSGSIZE;
> +
> +               /* Wake the calling thread */
> +               wake_up_interruptible(&ec_uart->response.wait_queue);

I believe the "received" conditional variable should be set before calling
wake_up_interruptible. Otherwise the calling thread will not be (immediately)
awakened as the condition is still false. Currently, the calling thread will
wait until it times out in this case.
