Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC563222
	for <chrome-platform@lists.linux.dev>; Tue, 22 Nov 2022 19:05:16 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id p8so10068747qvn.5
        for <chrome-platform@lists.linux.dev>; Tue, 22 Nov 2022 11:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V113i9op2pduVlxmzasvaIEvnqTrh+10a7z1AWq+aEg=;
        b=DBN3eB8VZE6euKV0t6YywqYDdM8aZxRa6ITHKBt4yJZC3AJTs9exx/n7bFt9NNjUKr
         5CjoFGf2TLv9zR78cgumEbZbl8oR5DgMThLgtJ+KaaaS3gzcFVHTEufJFWw782w3jmc1
         /99JGLlaeNSdOl+n1kP9dtSZgkJV+TFm5U9I0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V113i9op2pduVlxmzasvaIEvnqTrh+10a7z1AWq+aEg=;
        b=epKwwFJIhtr7O2LRfWdnTGEr4SwKvzjA1pbGAjiOI+d4epDqL1P+yWszBYXb+zKbqU
         LLc8/mpmlYz3n086PLDOSakoVfUR8O5cuJFKC1fidsytUq/lPYFfh4uNBaH1Bp5QvvDV
         krkBOJ5t+CGtK7H42A0lL7LK1BtKUyaaCAqYfnpftK9SNCgWkp3OIeJy/GbYtbQuDbnr
         8P8wNkljs1lIp6r2bRKQwbKOzN98cFiB+ErCVblCr///rnrgE/r6xOiQ8uNCOBl9yS18
         1zjLqtU+7nE/3IJ69v70zo+ChGm95NJLApOUXDq7mk7HR3m/BvkL03FX7VvJ6rbE6BPk
         Fx1A==
X-Gm-Message-State: ANoB5pnOlsgYO6K3cBqDn/N9ZM2t8EFo41YrzPSgAoHypSmbiUNoRANt
	Tf2jVcIxWB4eMrjxciNeRSNGrzH4JZaQRpOInnnATA==
X-Google-Smtp-Source: AA0mqf4+8dUqlIgr/8H6RT8a2TGpmcGq48sFYZ4zLYA7vHnHmcToY6FLgEsJDVQJxOqoXpyoHy4JHeCWbd8mcGxWiSE=
X-Received: by 2002:ad4:4c03:0:b0:4bc:182e:78c2 with SMTP id
 bz3-20020ad44c03000000b004bc182e78c2mr4883234qvb.2.1669143915309; Tue, 22 Nov
 2022 11:05:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221121201337.2772216-1-pmalani@chromium.org>
 <20221121201337.2772216-2-pmalani@chromium.org> <Y3ydPqkxxQCSGGp7@kuha.fi.intel.com>
In-Reply-To: <Y3ydPqkxxQCSGGp7@kuha.fi.intel.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 22 Nov 2022 11:05:04 -0800
Message-ID: <CACeCKaeCA3+0BVyUO72HvUbV7mcjEcGT4uXnA2X8=CUdjdtOuQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] usb: typec: Add helper to get partner device struct
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Benson Leung <bleung@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <groeck@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Heikki,

Thanks for reviewing the patch.

On Tue, Nov 22, 2022 at 1:58 AM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Let's not loose the protection around these devices unless there is no
> other way, and in this case there is.
>
> Please just create a wrapper for usb_power_delivery_register() instead:
>
> struct usb_power_delivery *
> typec_partner_usb_power_delivery_register(struct typec_partner *partner,
>                                           struct usb_power_delivery_desc *desc)
> {
>         return usb_power_delivery_register(&partner->dev, desc);
> }
> EXPORT_SYMBOL_GPL(typec_partner_usb_power_delivery_register);

Sounds good. I'll send a v2 with the above change as patch 1 (instead
of the current patch 1).

I will list you as the "Suggested-by" tag (but please let me know if
you'd like attribution stated differently).

Thanks again!

-Prashant
