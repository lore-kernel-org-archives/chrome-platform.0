Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9CF5382
	for <chrome-platform@lists.linux.dev>; Fri, 26 Aug 2022 22:42:00 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id n21so2247693qkk.3
        for <chrome-platform@lists.linux.dev>; Fri, 26 Aug 2022 15:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=3FV8KCi0eK0OYqVvKJ/bGBoHBlxMg4pZUjZlSa7NDhE=;
        b=QPn/UljNvn1jh6/KTyMRkKx3YkKr7mR07kzA4/Uwjsic96qUrmuGVvSmreCQVtiPNF
         UYtUGIM5xK9pvqccmR9OBaz9WfFMiZcwf6jJkc1xixXKE6L5PDWxs4PKjk6f4vEok/MK
         /OTfi7Ru+2eiHTjqEN2nGHyJ9w7brJKYrGiAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=3FV8KCi0eK0OYqVvKJ/bGBoHBlxMg4pZUjZlSa7NDhE=;
        b=HqXN9/+2PEWDrZs9G0NkIZa0Y5X7xIWzT8PaEFX1cSUS7hjNIWhPhtTKoPIEIolne0
         vj5LcEkv69Pp5VFA7gUVhrYQlQInb/kJroiSMNqoMVQplgKwzws4j6ZoG7IDXeeqSaQe
         O8gHdiwkq1otkhIdqvjCida/yExkgMeZXsemaf/W3uC4hhQWCey0HvInIa5S6eI4C4ko
         qpVR/np7IiYqlnvND9scjGs534ojzslX44ot/PrfeVKET531NmXl7Z22lQv/W+VKJrkW
         1+SwJq0+9WaYPxTqD3GO7WrN9s4P3jyPpzRtV+CC+uBlT3jqIf39FQWKen6oDaVCmBij
         axdQ==
X-Gm-Message-State: ACgBeo0CmRA6s5tIsOcZjkuPyXWFol5p3r+gT08mVtNxX3JIoyd8hQM5
	eDANuAvIbjdftJNoyw4LzWpjrMu1YBzig0GCXeA2zw==
X-Google-Smtp-Source: AA6agR5mUHqmoyjkSgGYnIHALwXRxS29qzcU5DuHX7qeu+4HF4ozsmDfcUVUcwjy6pmq4mphYEUSaYXvQRxbi45sk1c=
X-Received: by 2002:a05:620a:4553:b0:6bb:1dd0:e44c with SMTP id
 u19-20020a05620a455300b006bb1dd0e44cmr1288845qkp.543.1661553719348; Fri, 26
 Aug 2022 15:41:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220819190807.1275937-1-pmalani@chromium.org> <166155361559.15250.6333484675187018145.git-patchwork-notify@kernel.org>
In-Reply-To: <166155361559.15250.6333484675187018145.git-patchwork-notify@kernel.org>
From: Prashant Malani <pmalani@chromium.org>
Date: Fri, 26 Aug 2022 15:41:48 -0700
Message-ID: <CACeCKacPZNLYA-OwMohNQzo-NpqoM6WXz73dcAJJ11h4wLJqcA@mail.gmail.com>
Subject: Re: [PATCH 0/4] platform/chrome: cros_ec_typec: Altmode fixes
To: patchwork-bot+chrome-platform@kernel.org
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	bleung@chromium.org, enric.balletbo@collabora.com, groeck@chromium.org, 
	heikki.krogerus@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 26, 2022 at 3:40 PM
<patchwork-bot+chrome-platform@kernel.org> wrote:
>
> Hello:
>
> This series was applied to chrome-platform/linux.git (for-kernelci)
> by Prashant Malani <pmalani@chromium.org>:
>
> On Fri, 19 Aug 2022 19:08:01 +0000 you wrote:
> > This is a short series of minor fixes and changes to prepare the
> > ChromeOS Type-C driver to better support alternate mode drivers.
> >
> > Prashant Malani (4):
> >   platform/chrome: cros_ec_typec: Add bit offset for DP VDO
> >   platform/chrome: cros_ec_typec: Correct alt mode index
> >   platform/chrome: cros_ec_typec: Stash port driver info
> >   platform/chrome: cros_ec_typec: Use Type-C driver data
> >
> > [...]
>
> Here is the summary with links:
>   - [1/4] platform/chrome: cros_ec_typec: Add bit offset for DP VDO
>     https://git.kernel.org/chrome-platform/c/1903adae0464
>   - [2/4] platform/chrome: cros_ec_typec: Correct alt mode index
>     https://git.kernel.org/chrome-platform/c/4e477663e396
>   - [3/4] platform/chrome: cros_ec_typec: Stash port driver info
>     (no matching commit)
>   - [4/4] platform/chrome: cros_ec_typec: Use Type-C driver data
>     (no matching commit)

This message isn't completely right; I've only applied patches 1 and 2
( 3 and 4 will be resubmitted as part of the altmode support series
later).
