Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EA619890
	for <chrome-platform@lists.linux.dev>; Thu, 27 Jul 2023 18:30:44 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-444c42f608aso539367137.1
        for <chrome-platform@lists.linux.dev>; Thu, 27 Jul 2023 11:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690482643; x=1691087443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=voiXLpkjPfzBEig254frn/V48hVLiCZ+gaG536em0hA=;
        b=PF8IURyZFYgmN0pgk84vMOtKwHOcUBIAg5DhqViJlJEZQl2ZR8V0oPwcphx/xxnmFp
         VqCi699ZtQqNK4g4OJmW1zFyQ4VatxSTymZxcN+kUbweH1+56ETeVeeHu/PbV4glGmkA
         lc1Yn8xeby5Ak/jBzk2Fy7C+LQN7PlL6/rsXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690482643; x=1691087443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=voiXLpkjPfzBEig254frn/V48hVLiCZ+gaG536em0hA=;
        b=CqxEuOUyQwd9F25hYIm1eFfns6gLW9Bh7WhnfGZ1kgba+KyAPPJiywVmaPEvUrEsl2
         T4GtCtbgeGFc9ZP7IVk5HnIXImQfPbots0kDWa4jDG0kVY/PztIo1ZiNxjKFRa3RsxuA
         +fMjtdF+JNkx5CjhKeRbjIjvpQoajq8lwBehbpmvu7FFPFgb5IjQsNAKAXBoHIzv3U2C
         yRwBbpNZPevM3FnzJ6k3lAeB4I5koHbK+z7mvQ/nijeBuThNwJ6nq24fLBrxk/ctOQw6
         nyPlNsOQ/fa5VBAbiuScc/SLuWOQbDXUbHqiutSGwPQw+Bj+qDCHILMxZxqSEHmAQeQ6
         XdXA==
X-Gm-Message-State: ABy/qLYoJmOAVzUxTDo0+DowTA4ALHHbaixY/TC3dYHPXyewmJIL3IPH
	Mnz/st+akcvyoFDQo1HCUT2dK5QmAbPZp58FWAo=
X-Google-Smtp-Source: APBJJlETF60nt47vsUwsfFMa95e8ALBdQpIpHrQW8x8bKxac0l39NUBUaH1cEGkuLC18c+Ht0pfQwg==
X-Received: by 2002:a05:6102:2f5:b0:443:7787:8333 with SMTP id j21-20020a05610202f500b0044377878333mr351572vsj.8.1690482643320;
        Thu, 27 Jul 2023 11:30:43 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id l20-20020ab053d4000000b006904fa86e7csm305327uaa.2.2023.07.27.11.30.42
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 11:30:42 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-486198c70adso450320e0c.0
        for <chrome-platform@lists.linux.dev>; Thu, 27 Jul 2023 11:30:42 -0700 (PDT)
X-Received: by 2002:a1f:bf0c:0:b0:47e:30a:c7bc with SMTP id
 p12-20020a1fbf0c000000b0047e030ac7bcmr319345vkf.12.1690482641747; Thu, 27 Jul
 2023 11:30:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZLm3G5G6/gmLZwkn@tora>
In-Reply-To: <ZLm3G5G6/gmLZwkn@tora>
From: Raul Rangel <rrangel@chromium.org>
Date: Thu, 27 Jul 2023 12:30:30 -0600
X-Gmail-Original-Message-ID: <CAHQZ30Dn8pT4X_=XZCFGEy2ijXTfJskSLUoQV6o_QC5v446Z4Q@mail.gmail.com>
Message-ID: <CAHQZ30Dn8pT4X_=XZCFGEy2ijXTfJskSLUoQV6o_QC5v446Z4Q@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_lpc: Add DMI definition for
 post-Skylake machines running custom Coreboot builds
To: Alicja Michalska <ahplka19@gmail.com>
Cc: linux-kernel@vger.kernel.org, robbarnes@google.com, lalithkraj@google.com, 
	bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev, 
	Mrchromebox@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 20, 2023 at 4:37=E2=80=AFPM Alicja Michalska <ahplka19@gmail.co=
m> wrote:
>
> ChromeOS EC LPC lacks DMI match for newer machines, which
> use "Google" DMI_SYS_VENDOR as opposed to "GOOGLE" in older models.
> This patch adds DMI definition for MrChomebox's custom Coreboots builds,
> which we (Chrultrabook Project) are using.
>
> Signed-off-by: Alicja Michalska <ahplka19@gmail.com>
> ---
>  drivers/platform/chrome/cros_ec_lpc.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chr=
ome/cros_ec_lpc.c
> index 500a61b093e4..6ac993be4eb1 100644
> --- a/drivers/platform/chrome/cros_ec_lpc.c
> +++ b/drivers/platform/chrome/cros_ec_lpc.c
> @@ -533,6 +533,14 @@ static const struct dmi_system_id cros_ec_lpc_dmi_ta=
ble[] __initconst =3D {
>                         DMI_MATCH(DMI_PRODUCT_NAME, "Glimmer"),
>                 },
>         },
> +       /* DMI doesn't match modern machines running custom firmware */
> +       {
> +               /* MrChromebox's firmware */
> +               .matches =3D {
> +                       DMI_MATCH(DMI_BIOS_VENDOR, "coreboot"),
> +                       DMI_MATCH(DMI_BIOS_VERSION, "MrChromebox-"),
> +               },
> +       },
>         /* A small number of non-Chromebook/box machines also use the Chr=
omeOS EC */
>         {
>                 /* the Framework Laptop */
> --
> 2.41.0

+ Mrchromebox

Hrmm, it looks like this table is only used if the GOOG0004 ACPI
device wasn't found. Is the MrChromebox fw missing this ACPI device?
