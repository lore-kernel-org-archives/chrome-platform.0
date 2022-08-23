Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD5E3202
	for <chrome-platform@lists.linux.dev>; Tue, 23 Aug 2022 17:14:26 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id e28so10883856qts.1
        for <chrome-platform@lists.linux.dev>; Tue, 23 Aug 2022 10:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Jl7QpGWs3fSIOiwFofszvrGHHvncc4MbU/7u4S5E9/8=;
        b=TVRjqNKTkcZsOWoJUtNkKqkrqnNgsUcxZ3iU7mf9gQMukXt6eadTKffbXPftXiPSw7
         pbFdaX/XvKcKsmy0y0iOhL+TWd/nqVt6EKTwiGap0p7R7LfDX5ARSpal7E01PxEC7fyi
         osQ34y+6+VdnAkdUziRNLHbQag8PfiJU9szmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Jl7QpGWs3fSIOiwFofszvrGHHvncc4MbU/7u4S5E9/8=;
        b=0KiWUChjIwrOlmYZ31U+zvBkqQkLE8bgTfBuJKdfeUmJrY1IKkKaVx/ptB5PzaaGJz
         0tzH9+GmTwJ2rOA2yzVeZDsKEGSHGPRV3WRvx8Y7u7vPYEgFUxGVhbCcxtjJlZSG/NYu
         J1irk9FcEaMCsspQd325qHGZNG0QdCytflr1leAGObhzDn7N8BJZg2pUMPcD/OXbuHmK
         3tpkk5qxya1mEwv6IQvf9WKQMD2QwG0Pp2nftnyMvbmAMsaUoLBAUdqaiOyZqLOW8LDO
         F/bF1Z6pHnsjNCOkb7umyUzfcb89ze+sdojSajAKdUl58WB2lmTNLvb24t9tkHUjEwLR
         Eh6A==
X-Gm-Message-State: ACgBeo1/rIrI0MK7Y0ikewGuEewNBpsWIvNV7TMYWBAqkPKpqOcXccbt
	XA4I/qXk95VgraAuzm0E/xID0I1haCuQhHzoCH399g==
X-Google-Smtp-Source: AA6agR7yZgIhhbEKYBINUBSQ28jS9HzTWpx//defT/uB39yIdcraprXQFrAHtvaBYb93jBLIeUBHy3EZq6WbpST8MqA=
X-Received: by 2002:ac8:5ad2:0:b0:344:90e7:410f with SMTP id
 d18-20020ac85ad2000000b0034490e7410fmr20659384qtd.625.1661274865816; Tue, 23
 Aug 2022 10:14:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220819190807.1275937-1-pmalani@chromium.org>
 <20220819190807.1275937-3-pmalani@chromium.org> <YwSMYb67PMAEkv8f@kuha.fi.intel.com>
In-Reply-To: <YwSMYb67PMAEkv8f@kuha.fi.intel.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 23 Aug 2022 10:14:14 -0700
Message-ID: <CACeCKadLYXPLSLzgv5YbBLjb3Tc73-_qiTM_HBDq4CXbAw+8Yw@mail.gmail.com>
Subject: Re: [PATCH 2/4] platform/chrome: cros_ec_typec: Correct alt mode index
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	bleung@chromium.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>, 
	Guenter Roeck <groeck@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Heikki,

Thanks for the review.

On Tue, Aug 23, 2022 at 1:14 AM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi,
>
> On Fri, Aug 19, 2022 at 07:08:03PM +0000, Prashant Malani wrote:
> > Alt mode indices used by USB PD (Power Delivery) start with 1, not 0.
> >
> > Update the alt mdoe registration code to factor this in to the alt mode
> > descriptor.
> >
> > Fixes: de0f49487db3 ("platform/chrome: cros_ec_typec: Register partner altmodes")
> > Signed-off-by: Prashant Malani <pmalani@chromium.org>
>
> Shouldn't this be applied also to the stable kernels?

We're not planning on backporting alt mode driver stuff to older
kernels, so probably not necessary
(aside from where it gets auto-magically picked).
Userspace currently doesn't use the mode index for anything.

Please LMK if you still feel it should go to stable.

>
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>
