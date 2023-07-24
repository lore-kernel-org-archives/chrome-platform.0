Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0C4568C
	for <chrome-platform@lists.linux.dev>; Mon, 24 Jul 2023 13:43:08 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5222b917e0cso1709277a12.0
        for <chrome-platform@lists.linux.dev>; Mon, 24 Jul 2023 06:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690206187; x=1690810987;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d8l/XZoEusy1agaeHqVwlRR+GPruNklFTxOY9mdNQPk=;
        b=PNaUIarb0oAXBTxANdUs5Tw5UpPh+20kFOl27v5Bcivqai7cZzjCGApNnvSa5qjtac
         0QVfrnrTcaybyN3G63CHGBJX8XOkD6oSKLsYS4sWFnzLO9rwa9Ide4GKUZyZASXCyMSz
         pBN4TABZc9XFEMjVxJ+uo8JYUn1MVfUHdux2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690206187; x=1690810987;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8l/XZoEusy1agaeHqVwlRR+GPruNklFTxOY9mdNQPk=;
        b=PoGNXL6KmdA4E9pQlJpetZ7J2PiCd0hLudlWp+2x8h7RiKVCqpfd36BYwnq5HRYtMR
         d4NPGqAn9P1ap8b+cGVSufMsclPO8n8IRYFqMsLBfCyEGoyDCqBumJNr/7UtN6nAPrlk
         zJIULctPwfqN5sxTEO5aTmWWHve4qTIL9/5c7nBc5mjGYQoOxfsGd7cozrKjof1cmdaF
         0xz5apKtxc4auxPsYAxh0j3wX5jforFaeEIYK6nHChknIZ6ZPRc/XiZPM1p7cnJ1/Sut
         B6dYPPgeN+onMk7hTMkupEY8bXDVlIgjNmVUR0wYrrZsomYkiFwIZSZWtuyvEklacxqw
         FlwA==
X-Gm-Message-State: ABy/qLaY7cljqafYs8eyxfYEmpd7FAg4AWqbKLP+W8j3BT7u/SbMo6wN
	1XdqVOL3qVZxE+n/JSmqYntPyAp77WJ9NuQGnhAqLg==
X-Google-Smtp-Source: APBJJlHNVkdYvbEPFmff2AAqm6+DRsdICEArj0WLtFHGCAdyGrNu1k1T8l8hMMV9YaO4cdMgRvPD7mVBmQO1oTK5naY=
X-Received: by 2002:aa7:d295:0:b0:522:2af1:1ffe with SMTP id
 w21-20020aa7d295000000b005222af11ffemr3020290edq.9.1690206186861; Mon, 24 Jul
 2023 06:43:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230724081247.678784-1-tzungbi@kernel.org>
In-Reply-To: <20230724081247.678784-1-tzungbi@kernel.org>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 24 Jul 2023 07:42:55 -0600
Message-ID: <CAPnjgZ2fDj6Ou1Q5141jGem7NxENgU_1akSQN5PTXLtFg_W5=g@mail.gmail.com>
Subject: Re: [PATCH v2] MAINTAINERS: Add drivers/firmware/google/ entry
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, gregkh@linuxfoundation.org, 
	chrome-platform@lists.linux.dev, jwerner@chromium.org, swboyd@chromium.org, 
	briannorris@chromium.org, dianders@chromium.org, dossym@chromium.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Jul 2023 at 02:13, Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> From: Brian Norris <briannorris@chromium.org>
>
> These are mostly used for Chrome platforms, so group it in with the same
> mailing list, repo, and (one) committer.
>
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> Acked-by: Julius Werner <jwerner@chromium.org>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
> This is a revival for v1[1] as it is few-months-old.
>
> Planning to let chrome-platform-firmware use:
> - "for-firmware-kernelci" branch for KernelCI[2].
> - "for-firmware-next" branch for both 0-day[3] and linux-next.  Patches can
>   rebase onto the branch if they are aiming to chrome-platform-firmware.
>
> Haven't figured out how to make it in linux-next specific files though
> (e.g. [4]).
>
> [1]: https://patchwork.kernel.org/project/chrome-platform/patch/20221021172624.1.I119456791d197eb7d159f09e7479d8759008a954@changeid/
> [2]: https://github.com/kernelci/kernelci-core/pull/2028
> [3]: https://github.com/intel/lkp-tests/pull/312
> [4]: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=4d2c646ac07cf4a35ef1c4a935a1a4fd6c6b1a36
>
> Changes from v1:
> - Update Tzung-Bi's email address.
>
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>

>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3be1bdfe8ecc..8293a4ab82d8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8758,6 +8758,15 @@ S:       Supported
>  F:     Documentation/networking/device_drivers/ethernet/google/gve.rst
>  F:     drivers/net/ethernet/google
>
> +GOOGLE FIRMWARE DRIVERS
> +M:     Tzung-Bi Shih <tzungbi@kernel.org>
> +R:     Brian Norris <briannorris@chromium.org>
> +R:     Julius Werner <jwerner@chromium.org>
> +L:     chrome-platform@lists.linux.dev
> +S:     Maintained
> +T:     git git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git
> +F:     drivers/firmware/google/
> +
>  GPD POCKET FAN DRIVER
>  M:     Hans de Goede <hdegoede@redhat.com>
>  L:     platform-driver-x86@vger.kernel.org
> --
> 2.41.0.487.g6d72f3e995-goog
>
