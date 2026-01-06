Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659F2337BB6
	for <chrome-platform@lists.linux.dev>; Tue,  6 Jan 2026 16:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767716548; cv=none; b=aPjkP04ObW9QpeY/hehAhBA5BOurZZ9jxzUl6s1eDBmclW8RfoPsdtn4NL+8F/6kkY/vwse3sZqCarkGHxxcssw/CR+tlKmY0YyfnPGJKgS+Jp2oP2G8ucBPaWYTPyzKs3Y0tVqCTA1iA2dGaI4IADVCiEuZHp1ySFBfbK60Z7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767716548; c=relaxed/simple;
	bh=dWuLj9vIX6Xr1gmSVDR+2ClTl5jKQSOkLp3CRmWgGzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L/fdOIz88MGGs6l91e6zXxImpkpM16dd1yN4QmzWvs2Pf6ukyE4f1j4dsu5WedkYuEdMr7DZAShCm1tr4jlTmG/mDIUUHVTkpWdXlF3Pgs667Su3Y1qgi74BIUITjdPBvTYE3Pym/xR4xlGACV6BpDvvyoiETrBEgXriq5BCE10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SBnu8nbs; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SBnu8nbs"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b843e8a4fbfso56651066b.0
        for <chrome-platform@lists.linux.dev>; Tue, 06 Jan 2026 08:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767716540; x=1768321340; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uX+lfAscht316YktzuAfhTqn9xtlSWRjZZvzo5p8u20=;
        b=SBnu8nbsfrwT0Ns2BRYPFMNoUiHym5eAytQG4++FAB1SLIhOuZtpp9LI8zTgP1izPG
         B/7ATp7dcuS0J+MF07sWycd8Eu/FkEF5oBgafrpOQmiHBjCo60BrlEyFboAgWuv5C/dE
         NxKrIKFDiUPClRKpHqTZWpifW9px5mDHI+EdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767716540; x=1768321340;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uX+lfAscht316YktzuAfhTqn9xtlSWRjZZvzo5p8u20=;
        b=VNi028gNDcQspISzC+Upf5DLry+aXBcuoW0IMciiKrXeMc2JBF3XQdBbcNY4FV6C1P
         jgEiL9ECSGN8M8g6z1agDMfIONcpp6F9IM23D8kozaa0nEHixnBbbkOk/oqJIZCnXSvi
         WTHRIhKO3J8KIcONIL45fhLhlEc4Nhg76+ed25FsLjKB4C1TWLyvn7jmkkfc+x3qvhcs
         PBfqMuboc4vZ40+WSE4Busi0SuiGDZJEcAOaNiI531b5URspHp6zRMHW9OFLQtnGzYdg
         0PtTgK/RnG8PUd66Ty943Inpz6tZn5qg5nV2wqGfbCRaqZGczZjTVaLMoqwDWQFGPsr4
         pENA==
X-Forwarded-Encrypted: i=1; AJvYcCVEOumZ9xIijouuT8+SjcreamyeFg7JLJOgBpILJ5jYsNBOHFxlWsAxeXf9XAMkfjVemW86yLkuc3spPAZmPYU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/Tdvg25v/PFaesgnyaf+TIydjeRAEpKE3DmC8ADVX68vod0mM
	bmGd4n9p1Yxu9cNFbflcQgAuZWNawG1C9T/pUeoS5yr9p8rcwSx60G0Na3fh82p2hsEkPtld56/
	bXiGiWjymENo2cA4lWsDGEksJFLNXelAOn49GwKqr
X-Gm-Gg: AY/fxX4hVfy0Y8mrUP3GQJRi4I7WREUk5LnqBxfWBbUcqwZI52VEh3lscIzDktfRcQG
	qhIfhXT5uVCs+TgR01s6p+2sD6SnIE0zEN3JLCqcC3JzahEm8sfGmxeIXVEbGzq4BUYsF3rT07u
	2nCsgy5GeNx+dgrXZ8SFvp8P3PQR5fx86k8eDE02hcpCWOEPMLCGED0TfB+CmBp+F1WBvJj48jj
	mpQfTDSf3y7vorvivlsjRSC+PvsAD8c1o7OKj2nxAf2KjQIVkwnWlK5pKl/X0uNiOCuEY2zMohp
	6W68
X-Google-Smtp-Source: AGHT+IH1kwvJFtp9y/n6/ONiW20q2rv3AbRml/XchfFRAgwVzGFRLV+QT8FB4w3lW9mYX4JDYpNYwhKMkzNzeEyEHEM=
X-Received: by 2002:a17:906:fd8d:b0:b76:b76e:112a with SMTP id
 a640c23a62f3a-b8426a423dbmr347721766b.11.1767716539722; Tue, 06 Jan 2026
 08:22:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260106112953.692304-1-fabiobaltieri@chromium.org> <20260106112953.692304-2-fabiobaltieri@chromium.org>
In-Reply-To: <20260106112953.692304-2-fabiobaltieri@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 6 Jan 2026 09:22:06 -0700
X-Gm-Features: AQt7F2qtMfWGAhGoeML78_KdDH89QwuHJwwSz10spdBmWVzi88rZjh-rN1XnT2o
Message-ID: <CAFLszTgMeRRi_=Bs6wzdZZGDn9DbmnZEdkbqPOhi0rqDs7DnPQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] Input: cros_ec_keyb - add function key support
To: Fabio Baltieri <fabiobaltieri@chromium.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-input@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Fabio,

On Tue, 6 Jan 2026 at 04:29, Fabio Baltieri <fabiobaltieri@chromium.org> wrote:
>
> Add support for handling an Fn button and sending separate keycodes for
> a subset of keys in the matrix defined in the upper half of the keymap.
>
> Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
> ---
>  drivers/input/keyboard/cros_ec_keyb.c | 174 +++++++++++++++++++++++---
>  1 file changed, 158 insertions(+), 16 deletions(-)
>

Reviewed-by: Simon Glass <sjg@chromium.org>

> diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
> index 1c6b0461dc35..74ac1700b104 100644
> --- a/drivers/input/keyboard/cros_ec_keyb.c
> +++ b/drivers/input/keyboard/cros_ec_keyb.c
> @@ -29,6 +29,11 @@
>
>  #include <linux/unaligned.h>
>
> +/* Maximum size of the normal key matrix, this is limited by the host command
> + * key_matrix field defined in ec_response_get_next_data_v3
> + */
> +#define CROS_EC_KEYBOARD_COLS_MAX 18
> +
>  /**
>   * struct cros_ec_keyb - Structure representing EC keyboard device
>   *
> @@ -44,6 +49,11 @@
>   * @bs_idev: The input device for non-matrix buttons and switches (or NULL).
>   * @notifier: interrupt event notifier for transport devices
>   * @vdata: vivaldi function row data
> + * @has_fn_map: whether the driver use an fn function map layer

How about: driver uses an fn function-map layer

Regards.

Simon
