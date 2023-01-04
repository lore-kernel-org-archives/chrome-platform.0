Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53373FEC
	for <chrome-platform@lists.linux.dev>; Wed,  4 Jan 2023 18:41:33 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id 203so37561442yby.10
        for <chrome-platform@lists.linux.dev>; Wed, 04 Jan 2023 10:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V1dRPJU4MdXr7AhvEfp9V8UzepfOOnVIYAc2m/AgMOQ=;
        b=CTDNr/RC+q50aWV+hPJVBcM0kwjHrJ+Squjp5dQYeMdRAlMLTYW6AUWGozIV63m6H/
         RuJ7O1HVN2+bWAj4GV+Q1ZxJvyVkhvIyGW/UxEcDrTp/wcQAhVQ+UCKP58Ynq8eACwgM
         blJj6zCXRq9pBQHqWKlQpTbTQBTxz0p2fii2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V1dRPJU4MdXr7AhvEfp9V8UzepfOOnVIYAc2m/AgMOQ=;
        b=Qr5YY5rAKv/iOLBipy6dEvKduOm4/X5QXyj1lGi5PpjujwmRHNxPX9UtaYg9xi7B4M
         np9bIF1vkWA0eRaBUhgT/w2dRR60ifphazNX6TBUL8CFYT3mbi0LTtHHNYYr3sGiTp+D
         3yY599fCrHZTmeiIMnxOFz97/OXGyhs/+iAm9Uk87aLtcTiOzx/a79ClZkQIfWYRDCFv
         zXY358NwVDEuCgya0mB+h/1NEBl1LatYNXK05clyknW+kJ0N1naW9KWX035qSOm6jWh1
         RxxEwlYlWpFY5jlVEwSnP5iKfg7QSrMLoWBRUjQ8ndxQpUkvgNWZKjoBUcZQacWi1ztE
         Hs2g==
X-Gm-Message-State: AFqh2kpjnFhQJRi4J1IoArgtvJMkC7jxQiWc8Kp+fYIzQ14zhAPLX7U1
	DfQSzdyBKZvjepkvHp9AC+Ay/nlRHzACnFMaazvKkg==
X-Google-Smtp-Source: AMrXdXufVqOEwxUUW5jATjfmK3mFMUU7flZ8EEkSh4TWBLg+BZjyKS8SKCSn7EV2GQFVsVE+WE654an3oJqh4SfGDq8=
X-Received: by 2002:a25:1083:0:b0:7ae:5e48:383b with SMTP id
 125-20020a251083000000b007ae5e48383bmr439846ybq.223.1672857692715; Wed, 04
 Jan 2023 10:41:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230104011524.369764-1-robbarnes@google.com> <20230104011524.369764-3-robbarnes@google.com>
In-Reply-To: <20230104011524.369764-3-robbarnes@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Wed, 4 Jan 2023 10:41:22 -0800
Message-ID: <CACeCKadFQEqA3tbR4fQvpc6O4L61zLCph8gigZria6CkFXEJ7Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] platform/chrome: cros_ec: Shutdown on EC Panic
To: Rob Barnes <robbarnes@google.com>
Cc: groeck@chromium.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, dtor@chromium.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 3, 2023 at 5:15 PM Rob Barnes <robbarnes@google.com> wrote:
>
> When an EC panic is reported, attempt an orderly shutdown.
> Force a shutdown after a brief timeout if the orderly shutdown
> fails for any reason.
>
> Using the common hw_protection_shutdown utility function since
> an EC panic has the potential to cause hw damage.
>
> This is all best effort. EC should also force a hard reset after a
> short timeout.
>
> Signed-off-by: Rob Barnes <robbarnes@google.com>
FWIW:
Reviewed-by: Prashant Malani <pmalani@chromium.org>
