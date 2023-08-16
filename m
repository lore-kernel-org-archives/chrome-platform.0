Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4B11078E
	for <chrome-platform@lists.linux.dev>; Wed, 16 Aug 2023 13:09:34 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-40c72caec5cso309241cf.0
        for <chrome-platform@lists.linux.dev>; Wed, 16 Aug 2023 06:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692191373; x=1692796173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xUwAHT07txR6ptb2hVJ8LK/09TxpB4H9kqcF6ppAaE8=;
        b=rPyfPbkAbWrh3YW4SmnhFMhYUcoYPn3I4h0zOMx2gdulY2aKXYGgVPciDIcr853yAi
         k7u9TgJLelbpmZvDUxCAwQmNm9Cv5X7wgempRnF2n13nY0rjznc7kPsz/HodJS7JkyrL
         5Ee/5U4EKh7eMQ1k8NllsSpf7ltlnEH3/26L2oRM3GZc9t5M3T5d7DgT9K+YKg4Ooa8x
         dasaBw6a/UmHmldv/d5s6lSz6Di90yGxhZ7WRD6TKyQejObx8imUNdd00tGkvgBORBqS
         FC7rsD5mZJR0ATkHjNvyXOWfpJ0UsoVEWw6NgUFKZQ6MZkmKm4NAW9pc4pdRuWdKnGYW
         z37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692191373; x=1692796173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xUwAHT07txR6ptb2hVJ8LK/09TxpB4H9kqcF6ppAaE8=;
        b=HAA0tTN1h5A7EPvMt3NjNxWHZzFbkr3xL9hXe62PAE7I+aVhqoVPrS+8dSgZ/Cx6AI
         aMUGlJw+jf/jB9IHQNJ9i8xjuy31pBzWkcXFCYjgcudJVLzER4cSxUNmLD3/Ntbn9zHs
         qXeqrU3jp8pa8aiKawE6yue0Z7Vs3fLuWLpjmLC5rnU8wOZrbjAwwBr1Qu5TRQubhalV
         fHPt2AWmZRPKh9oWkiE7+uPJj7Y0YiuTE9T8Yl9ks661sKSmBS+V5GSCuRWIlkTq8bTs
         Be7wxJfi3Ze9Tk5aPIEkxWe/qhaT9LssOC7wMOE7Ny/WnsGDTusFKBpPweWKaQuFLj7g
         aJfw==
X-Gm-Message-State: AOJu0YyUVP/QY+wsqKwOjycdcxDcmI/FsGg/LiRksAgbV8enEMyHakLe
	cnluP/EQv1OBA4E3g82tXQkC2qkpj6qffiAmN2+CIg==
X-Google-Smtp-Source: AGHT+IFsy1XvDp2NA9YFpnEew7M+xp5eAZzId2tM8tvK4Tz07m1370FGZFk9MXz5S+0gKJ3YKaM49mKWC9Yi2k6w/1o=
X-Received: by 2002:a05:622a:100f:b0:403:affb:3c03 with SMTP id
 d15-20020a05622a100f00b00403affb3c03mr284520qte.10.1692191373497; Wed, 16 Aug
 2023 06:09:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230816104125.712370-1-sadolfsson@google.com>
In-Reply-To: <20230816104125.712370-1-sadolfsson@google.com>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 16 Aug 2023 06:09:20 -0700
Message-ID: <CABXOdTe53fzK2eZ586cMh93tv+Bt=1+0Gg=-P8yBfWpoxrjf9w@mail.gmail.com>
Subject: Re: [PATCH] media: cros-ec-cec: Add Constitution to the match table
To: Stefan Adolfsson <sadolfsson@chromium.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Reka Norman <rekanorman@chromium.org>, linux-media@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 16, 2023 at 3:42=E2=80=AFAM Stefan Adolfsson
<sadolfsson@chromium.org> wrote:
>
> From: Stefan Adolfsson <sadolfsson@chromium.org>
>
> Constitution has two HDMI ports which support CEC:
>     Port B is EC port 0
>     Port A is EC port 1
>
> This patch depends on "media: cros-ec-cec: Add Dibbi to the match
> table".
>
> Signed-off-by: Stefan Adolfsson <sadolfsson@chromium.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/m=
edia/cec/platform/cros-ec/cros-ec-cec.c
> index 29f9a464857b..3c27349ce1d6 100644
> --- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
> +++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
> @@ -313,6 +313,8 @@ static const struct cec_dmi_match cec_dmi_match_table=
[] =3D {
>         { "Google", "Lisbon", "0000:00:02.0", { "Port B" } },
>         /* Google Dibbi */
>         { "Google", "Dibbi", "0000:00:02.0", { "Port D", "Port B" } },
> +       /* Google Constitution */
> +       { "Google", "Constitution", "0000:00:02.0", { "Port B", "Port A" =
} },
>  };
>
>  static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
> --
> 2.41.0.694.ge786442a9b-goog
>
