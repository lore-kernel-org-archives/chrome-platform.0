Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35765F9F2
	for <chrome-platform@lists.linux.dev>; Wed,  2 Aug 2023 18:17:14 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4f14865fcc0so517e87.0
        for <chrome-platform@lists.linux.dev>; Wed, 02 Aug 2023 11:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691000233; x=1691605033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrCRBhBQL3OtQ+bHa7OyL271Q2ifOyGlImfq9DRj0XA=;
        b=KBSM9HEiqRnrsTwkzR1yZazNJEjf91F4rThWMnAjH+mSjDVdadd0+FlL/Zbg3v7BMP
         jb0Ee+ZXNURqtQd8O+ZCf6ATHdJIOfEcTKZ578AdoQDp7gsMlthqx7erAFNqURcYYfUV
         xmOF4sWHPKg0JVD4ygDudhD1uoobp5P94A3d9QZAgCDTt0f8kSMOQ7gLA1gFIBpo1tSb
         +UBt5o1SUF0yPXBYBLV9RZj8I+NqxdYr8BznUk814OCxSLRY/k432oRa3xn0szO/AdGM
         Ltq6P2nsvqt/9HyST0CRH+/8gns5/j/u9wsqp0KJybUdRCenDkXQc8ztoKa8UIA23p2f
         WWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691000233; x=1691605033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rrCRBhBQL3OtQ+bHa7OyL271Q2ifOyGlImfq9DRj0XA=;
        b=gHmigvU9+bqWj3rJOks8KDDnFSCIUrSLv7qEL3mPgKxmOQsoI7K4UBDGMFovfAvkHE
         79qWQOzHRsUR37q+rcpwmkQxytwr16lB6lzOyb/BuCqmhmVg0LIwUwef3zGBE6uGpYhZ
         j+yoRSxWPkqNA7fZDThpYh5MHyKHq21GS5CjMN/wMRylBO9NPnWvU7v/RP1N82/fXVTp
         FgUCzXl8km4jhyMdHVlRcVvXLd7swCC8FzBPrMg253ywx2N31vBxES7o7bRM/5Q/ZsSF
         Jg9iWBZRGsrfaPsJw4Nu0qnc7/amRZyXPX4DO/dvZF6boaE1rAdbDjjr39TL3ctjN0zj
         xD6w==
X-Gm-Message-State: ABy/qLY83OWIQepFdJ2Xd/7VmNnX68rAwX+wl9GYUy+zGbTf9N5f46t7
	3AobfgGH9rWTkYfd8v8Sn43hgcslRz8t9cqEZW6lPw==
X-Google-Smtp-Source: APBJJlEO1A+9k5TPeXApIKpU5BAdebVzfqO2UFz8PXgDQU3iKOSjIOMUTuSWMd8o+lSP1RhohVYl/vVaYEiQkGFxW1c=
X-Received: by 2002:ac2:4477:0:b0:4ec:5157:bb37 with SMTP id
 y23-20020ac24477000000b004ec5157bb37mr290237lfl.2.1691000232445; Wed, 02 Aug
 2023 11:17:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230726181738.1.Ic6b8e25120b2aec95e3d0f4ac92c2a35fc7a40e8@changeid>
 <169079822136.24246.16960757983645261559.git-patchwork-notify@kernel.org>
In-Reply-To: <169079822136.24246.16960757983645261559.git-patchwork-notify@kernel.org>
From: Rob Barnes <robbarnes@google.com>
Date: Wed, 2 Aug 2023 12:16:35 -0600
Message-ID: <CA+Dqm30s282gcs6PHkZkH92mhndLi5YP=NPwS0duorizJfx+oQ@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_lpc: Sync filesystem on EC panic
To: patchwork-bot+chrome-platform@kernel.org
Cc: bleung@chromium.org, groeck@chromium.org, tzungbi@kernel.org, 
	dtor@chromium.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Note: This change is being rejected upstream due to the use of
ksys_sync_helper. Apparently it's discouraged. I sent a new patch to
replace this one:
https://lore.kernel.org/lkml/20230802175847.1.Ie9fc53b6a1f4c6661c5376286a50=
e0cf51b3e961@changeid/

On Mon, Jul 31, 2023 at 4:10=E2=80=AFAM
<patchwork-bot+chrome-platform@kernel.org> wrote:
>
> Hello:
>
> This patch was applied to chrome-platform/linux.git (for-next)
> by Tzung-Bi Shih <tzungbi@kernel.org>:
>
> On Wed, 26 Jul 2023 18:17:39 +0000 you wrote:
> > Perform a filesystem sync when an EC panic is reported. The
> > sync is performed twice in case some inodes or pages are
> > temporarily locked. Testing showed syncing twice significantly
> > improved reliability.
> >
> > hw_protection_shutdown is replaced for a couple reasons. It is
> > unnecessary because the EC will force reset either way.
> > hw_protection_shutdown does not reliably sync filesystem
> > before shutting down.
> >
> > [...]
>
> Here is the summary with links:
>   - platform/chrome: cros_ec_lpc: Sync filesystem on EC panic
>     https://git.kernel.org/chrome-platform/c/0a329167220a
>
> You are awesome, thank you!
> --
> Deet-doot-dot, I am a bot.
> https://korg.docs.kernel.org/patchwork/pwbot.html
>
>
