Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8B427F00
	for <chrome-platform@lists.linux.dev>; Fri, 21 Jul 2023 17:29:14 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4fdddf92b05so3131037e87.3
        for <chrome-platform@lists.linux.dev>; Fri, 21 Jul 2023 10:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689960552; x=1690565352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F08KAtvy0KJ26wsao6zq1OV/NB54IO3TMvYDTGLgN88=;
        b=mlkESRJESGxoZQEKyF5zLu5HQPv5XdhTiV9zrT0ZJq8WLw6E00CpDcaABzqdgFS4dz
         8M1D5mw7gPD8fH5PoGzPRnzaP7I1cXJnrk+3NbuS+Kwg9ryzE6iWcqhT6UDCxhoY4eQ3
         3EPirUWVL3rMq1L1mpkh7di2w77n9DerBbCEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689960552; x=1690565352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F08KAtvy0KJ26wsao6zq1OV/NB54IO3TMvYDTGLgN88=;
        b=Kv3IwDc2DxfjsyWpxUVnxhRrtafWg+oYniGwpLY+C77078w8g7XTaHfVg6jfOLLeCF
         BfF9vUUqcw5KI/BaXdmwkaoJDuDwz1Iv14rtGl4ksEoOi+gW7rVz3GdctDIrcrCvkNDc
         LG/1r9gI4U7XvktvT9LXD2GZ+h7DXXXg1P9JhUAoloiaEExl57zGq+JYA7k636XCTLyI
         crKY30DmIvkSa+9X/QOJQbmORZ38mt79xbrqc1ycikpxdMMFhhzCwVSkB52q1pu2tYww
         iieOK1lHwTA87BcruUyM6dxVlghsEuan0LzqmR+Uo/LWKCTi6aJv56fbjvZV7fw0hOvT
         Q+fQ==
X-Gm-Message-State: ABy/qLYNRU2pXXRKfniJd6Dxhnn4xDitIjb5hun+u0vtI1o0X6Lz3Bbg
	QPzida16FELwG/F4lEKK8OwUOUGp8Fho1CimBRY=
X-Google-Smtp-Source: APBJJlF/Hyye5xd7WuIugjDK9OoJI2X2+3VRUvIh8JlEysoBLB8R6OmQeDYFqzrNwdOujEEHpBjaLQ==
X-Received: by 2002:a05:6512:33c9:b0:4fb:7675:1ff9 with SMTP id d9-20020a05651233c900b004fb76751ff9mr2237897lfg.9.1689960552218;
        Fri, 21 Jul 2023 10:29:12 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id g26-20020a50ee1a000000b0051e2549c4f9sm2381571eds.47.2023.07.21.10.29.11
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 10:29:11 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-992ca792065so335221266b.2
        for <chrome-platform@lists.linux.dev>; Fri, 21 Jul 2023 10:29:11 -0700 (PDT)
X-Received: by 2002:a17:906:1d8:b0:988:4dc:e3a3 with SMTP id
 24-20020a17090601d800b0098804dce3a3mr2137406ejj.31.1689960550768; Fri, 21 Jul
 2023 10:29:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZLm3G5G6/gmLZwkn@tora> <ZLooCXV11JCdWOdK@google.com> <b1370c4b-7bad-4aac-0fa7-32d6479aa255@gmail.com>
In-Reply-To: <b1370c4b-7bad-4aac-0fa7-32d6479aa255@gmail.com>
From: Brian Norris <briannorris@chromium.org>
Date: Fri, 21 Jul 2023 10:28:59 -0700
X-Gmail-Original-Message-ID: <CA+ASDXOuJVG7bpXdKMf9nobjJ=qcTiBWVj+TQ3Kpwqct27HSag@mail.gmail.com>
Message-ID: <CA+ASDXOuJVG7bpXdKMf9nobjJ=qcTiBWVj+TQ3Kpwqct27HSag@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_lpc: Add DMI definition for
 post-Skylake machines running custom Coreboot builds
To: Alicja Michalska <ahplka19@gmail.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, linux-kernel@vger.kernel.org, robbarnes@google.com, 
	lalithkraj@google.com, rrangel@chromium.org, bleung@chromium.org, 
	groeck@chromium.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 21, 2023 at 10:16=E2=80=AFAM Alicja Michalska <ahplka19@gmail.c=
om> wrote:
> I've explained the reason behind adding this patch, but we'll go with
> different approach next time around.

FWIW, I'm also confused about your first sentence the same way
Tzung-Bi is. If two people are confused by parts of your description,
then maybe it needs improvement :)

> Since we're discussing this, I would like to suggest removal of DMI
> matches for EOL machines from lines 503...535 (Link, Samus, Peppy, Glimme=
r).
>
> Those machines aren't supported by Google anymore. Patch I suggested
> will match DMI while running custom firmware.
>
> If maintainers are okay with it, I will submit a patch removing DMI
> matches for stock firmware running on those machines since it's not
> needed anymore.

That seems actively harmful. These devices continue to work just fine
with their stock BIOS, even if Google no longer supports updating the
Google-built OS. That doesn't mean people can't boot other OS'es
(e.g., their own ChromiumOS builds; or other Linux distros) on them.

Brian
