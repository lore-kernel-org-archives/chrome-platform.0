Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B663D11CA0
	for <chrome-platform@lists.linux.dev>; Fri, 28 Jul 2023 15:04:05 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-40550136e54so332591cf.0
        for <chrome-platform@lists.linux.dev>; Fri, 28 Jul 2023 08:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690556644; x=1691161444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P6/HfDaubTIMIFxeuAV36Gi20Ylyo7B3ON5TN39P2I4=;
        b=qBKfwSV+ZwQ6sEr259d4qUrgPzVfaTjCDprP1cGD9z1tWEiC/JSM47CJmsKWX7BmTx
         fiy812NI3OsnG5TAIKOTGxDcPfp8aDU+PYQoCiN1BlxL5+irXAfDCBFZz5HsuIQxp6Iw
         hgMN7FuAwHOQI3s4OhUVjz7PVURGp0XcBgRmTJ6Aub+8UEiHW2q/jyLOmviz60HAl0zC
         uLBxm7sg8JDlv1IwAjbOxYHIKmIThJmYnV/0xpqgYyi30l6fb+d/kHvq0Bfp7yMVUocu
         1JM9s/v49FQGXYHi32FJMlwWX0SNNiZ/Z2mINyxMI3h4EbhLEZIPGipHG4fqdnPySPmF
         OXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690556644; x=1691161444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P6/HfDaubTIMIFxeuAV36Gi20Ylyo7B3ON5TN39P2I4=;
        b=Z9PDFGO8LLQ6VcWBlmVxp8CBLyWUcd3k1u2exintl9Biy3aHF+zHZw7UvnXSano1Nu
         0ew6h5j96/SAwN5CFHoNfyjaXMWoe524bFZwS5+TDWzJ3r0F8K3jRE4vglUSP8Vdwd1q
         faQMnm2986R+SM8vtnzNJTqmCDSuzETZp3cpvw304iz/WYXoy8qVqeaK6JlDi4aP6jDR
         uAPhrENjFY2l6Fi4FNkXoo3ItByotsKuHUjjOKnZCOQi8UJo8cUvxQNGBUZ08sBJT9KJ
         QGjHRsGCk+S6wdanFa4OL9fWizE1Jf2j7n9Hh5WQe6dJ5dWRbiT1FOu1UZPsF4ohrOtp
         ryhw==
X-Gm-Message-State: ABy/qLY6tVAdBbt91/W4hDtWErfYd4CO8wrzVf9Yc+vcRwxsRdkIDKE6
	oP4I/MFc4+YdmjcgTdp/YNCPUrHlEKgK4+38uzFscA==
X-Google-Smtp-Source: APBJJlHOs1cmIsvJup/NilltNKlcu9VKvvx28/8sGufxTG2GPnKmqYLl2df29lTIbwyOLT/wrpHOLFWvk817KYREl5M=
X-Received: by 2002:ac8:4e4f:0:b0:3f4:f0fd:fe7e with SMTP id
 e15-20020ac84e4f000000b003f4f0fdfe7emr244256qtw.3.1690556644425; Fri, 28 Jul
 2023 08:04:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230728065438.4026629-1-tzungbi@kernel.org>
In-Reply-To: <20230728065438.4026629-1-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Fri, 28 Jul 2023 08:03:50 -0700
Message-ID: <CABXOdTca9hmjWXNATeSkhZAV1PXh1ppt6ENEV23xUpO86ogu_w@mail.gmail.com>
Subject: Re: [PATCH v2] platform/chrome: chromeos_acpi: support official HID GOOG0016
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: rafael@kernel.org, lenb@kernel.org, bleung@chromium.org, 
	groeck@chromium.org, chrome-platform@lists.linux.dev, 
	linux-acpi@vger.kernel.org, guillaume.tucker@collabora.com, 
	denys.f@collabora.com, ricardo.canuelo@collabora.com, 
	usama.anjum@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2023 at 11:55=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org>=
 wrote:
>
> Support official HID GOOG0016 for ChromeOS ACPI (see [1]).
>
> [1]: https://crrev.com/c/2266713
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
> Changes from v1[2]:
> - Preserve the PNP ID GGL0001 for backward compatible to older firmwares.
> - Modify commit title and message accordingly.
>
> [2]: https://patchwork.kernel.org/project/chrome-platform/patch/202307280=
14256.3836298-1-tzungbi@kernel.org/
>
>  .../ABI/testing/sysfs-driver-chromeos-acpi    | 30 +++++++++----------
>  .../acpi/chromeos-acpi-device.rst             |  5 ++--
>  drivers/platform/chrome/chromeos_acpi.c       |  2 +-
>  3 files changed, 18 insertions(+), 19 deletions(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-chromeos-acpi b/Docum=
entation/ABI/testing/sysfs-driver-chromeos-acpi
> index c308926e1568..8e8a5d6610b8 100644
> --- a/Documentation/ABI/testing/sysfs-driver-chromeos-acpi
> +++ b/Documentation/ABI/testing/sysfs-driver-chromeos-acpi
> @@ -1,4 +1,4 @@
> -What:          /sys/bus/platform/devices/GGL0001:*/BINF.2
> +What:          /sys/bus/platform/devices/GOOG0016:*/BINF.2

Doesn't the description mean that both sysfs directories might be seen
in the field ?
If so, replacing one with the other would be wrong.

Thanks,
Guenter
