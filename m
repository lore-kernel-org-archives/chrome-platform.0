Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD9E1D2ED
	for <chrome-platform@lists.linux.dev>; Mon, 31 Jul 2023 17:07:52 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4fe21e7f3d1so4888386e87.3
        for <chrome-platform@lists.linux.dev>; Mon, 31 Jul 2023 10:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690823270; x=1691428070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vW6vy9kvGdKvD3u4Nu2jLKjjS6qQrgIUKZoDVHDe5bU=;
        b=JhlA7AdvTSq3lBkXf6xjbdCWbWkH7dCBiF0IlHKZ+zeP/5T8wsFGMpAyE3lfanorP2
         YtDyeeWisDL7PcXE/v/thVoCdvbsKRyKvmMLZf8g2PL7C5ngd9Gl2aSc6ZCc8l1w0/Rl
         0vgEsFt9iDtTwVtG5RDrvyckIB+C3BuPJmYfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823270; x=1691428070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vW6vy9kvGdKvD3u4Nu2jLKjjS6qQrgIUKZoDVHDe5bU=;
        b=U060wL8PxQfoTbuoxBluyQlXhDvBl+BD7dWJO1CVZ3ypuanTAjtMkSOIGfRoFNOr3w
         3sXjIK0+66tPgHRHbYb/nJZ1nDqeEgcqpOxLQ6uxxjEsaXeaADU9FhGzTPQ39reoETFK
         ziDxQ8HSYzhYeBlzR8uYRgCmHejj2bmO28l9tqBIB055vEwCiapTpqKPRkxAiZaZDypk
         ydQvEUtMooOo2ZjTjbcaYbCVUzLJc8CNwUfQOe9SWIQmibYDPsUeyvJ/UrrkVlrpKm6D
         aSWS5r0mmTt7evbr8O72LJ9RNW7US6TXO48oCMSMbdqvpNOWU7AYXp6M2rxEKVPFcgRZ
         VGAQ==
X-Gm-Message-State: ABy/qLYoQJHjSk81Z7FNW5TRJpfdBGHEGpn8wJ1HSUyijwcfm0AhiIsJ
	jj5vG5tmqwuytqj0s4LjG6cv2l/ZLQ/25obBqXPKUQ==
X-Google-Smtp-Source: APBJJlG5FCsdMcAADrC+kYsMy9T918yeKXkMbL+laCmYy1npxFTcJzjk3B5ejgakPPXd5kZLPq12SFOJlhqGW6mN3Zk=
X-Received: by 2002:ac2:5319:0:b0:4fb:7c40:9f97 with SMTP id
 c25-20020ac25319000000b004fb7c409f97mr296332lfh.27.1690823270238; Mon, 31 Jul
 2023 10:07:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230731024214.908235-1-tzungbi@kernel.org> <ec78c7ba-11ea-97ec-fa5d-5cfceec7c7ba@collabora.com>
In-Reply-To: <ec78c7ba-11ea-97ec-fa5d-5cfceec7c7ba@collabora.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 31 Jul 2023 11:07:33 -0600
Message-ID: <CAPnjgZ08pCcZ9P+6mr6dfr-swS05L8h_G1M2NKtZg3R7B2=DMg@mail.gmail.com>
Subject: Re: [PATCH v3] platform/chrome: chromeos_acpi: support official HID GOOG0016
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, bleung@chromium.org, groeck@chromium.org, 
	rafael@kernel.org, lenb@kernel.org, guillaume.tucker@collabora.com, 
	denys.f@collabora.com, ricardo.canuelo@collabora.com, 
	chrome-platform@lists.linux.dev, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 31 Jul 2023 at 01:29, Muhammad Usama Anjum
<usama.anjum@collabora.com> wrote:
>
> On 7/31/23 7:42=E2=80=AFAM, Tzung-Bi Shih wrote:
> > Support official HID GOOG0016 for ChromeOS ACPI (see [1]).
> >
> > [1]: https://crrev.com/c/2266713
> >
> > Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
>
> > ---
> > Changes from v2[2]:
> > - Instead of replacing, appending "GOOG0016" in sysfs-driver-chromeos-a=
cpi.
> >
> > Changes from v1[3]:
> > - Preserve the PNP ID GGL0001 for backward compatible to older firmware=
s.
> > - Modify commit title and message accordingly.
> >
> > [2]: https://patchwork.kernel.org/project/chrome-platform/patch/2023072=
8065438.4026629-1-tzungbi@kernel.org/
> > [3]: https://patchwork.kernel.org/project/chrome-platform/patch/2023072=
8014256.3836298-1-tzungbi@kernel.org/
> >
> >  .../ABI/testing/sysfs-driver-chromeos-acpi        | 15 +++++++++++++++
> >  .../firmware-guide/acpi/chromeos-acpi-device.rst  |  5 ++---
> >  drivers/platform/chrome/chromeos_acpi.c           |  2 +-
> >  3 files changed, 18 insertions(+), 4 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
