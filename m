Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35F61640D
	for <chrome-platform@lists.linux.dev>; Mon, 10 Jul 2023 22:46:36 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4fb96e2b573so7866950e87.3
        for <chrome-platform@lists.linux.dev>; Mon, 10 Jul 2023 15:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689029194; x=1691621194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1kc719wFeXIBZhxeGvf3Y+MTcIYRnee7N32RFrCgfHE=;
        b=gePkx6+LRaaXI9WCWII+UuumINiqAi6oCHZwvDylTD2lHieOVb2gSDpDFUYeQXiNYt
         0NN275W4khR6DSKj3DKRW4FxuuetdwJJ5Fhay7rpmX+jVG2RwSNZieFLjXUBFqauhBD7
         rMedwafATwsMC4lY8NPhRDMJN5iGB/Cpr0OvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689029194; x=1691621194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1kc719wFeXIBZhxeGvf3Y+MTcIYRnee7N32RFrCgfHE=;
        b=TnMJ/4hcov4Xu6/jUqYm1qMooHfpRJVV+N5F3aU+jixK+eUVvU4XHgsmo+shorGwrh
         vnlh6Sl9j7/XDewOX59Er5EoQG9rU7auJaRq9FqnMoIcHTZdSAGKKLAdcV1OXaf68EZx
         H0mZaZe4gjs1LoeAE12RbVC2u2Gr4+AL1AWggRcyNyVYMxG/JJrv3Zesr4eVJI2WPx0S
         Bg/Kpj4dNVYlP77GA9HlXuGlXuf7CHDOf5dGxddsyflUiRlaZmHq2gqEK6LzBSv6Z0Oe
         8xZMMIRKYyecsOZBYivj4Da+eK/ofxav+JwD4NYLQ8Azwpmp/DcB42IjQsNIOwmi+v/l
         XTTw==
X-Gm-Message-State: ABy/qLaCP6+vyFoVshJSaCMLIianysgZhmyDKttP6oJFArzYakwqbdPw
	lQjDJ01WyXYmK74HpMjtcHKslKQCX1RrSxWywSA=
X-Google-Smtp-Source: APBJJlFgDRqR2q5v0/0CVRK18t7tE0xMsCnNrHP2Fl/8IHwIiq83jfg8MxDlAWZH7AtDeuoCTieEjQ==
X-Received: by 2002:a05:6512:1289:b0:4fb:745e:dd01 with SMTP id u9-20020a056512128900b004fb745edd01mr13060807lfs.45.1689029193999;
        Mon, 10 Jul 2023 15:46:33 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id w13-20020a50fa8d000000b0051dfa2e30b2sm273053edr.9.2023.07.10.15.46.33
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 15:46:33 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-99357737980so656090166b.2
        for <chrome-platform@lists.linux.dev>; Mon, 10 Jul 2023 15:46:33 -0700 (PDT)
X-Received: by 2002:a17:906:242:b0:993:ce6c:685c with SMTP id
 2-20020a170906024200b00993ce6c685cmr14230852ejl.18.1689029192682; Mon, 10 Jul
 2023 15:46:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230702195057.1787686-1-sashal@kernel.org>
In-Reply-To: <20230702195057.1787686-1-sashal@kernel.org>
From: Brian Norris <briannorris@chromium.org>
Date: Mon, 10 Jul 2023 15:46:21 -0700
X-Gmail-Original-Message-ID: <CA+ASDXMZ_ZnJfpsY-8ZRByiox8HCSZeY08MvGSpznLYBtVR1bw@mail.gmail.com>
Message-ID: <CA+ASDXMZ_ZnJfpsY-8ZRByiox8HCSZeY08MvGSpznLYBtVR1bw@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.4 01/12] platform/chrome: cros_ec: Report EC
 panic as uevent
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Rob Barnes <robbarnes@google.com>, Prashant Malani <pmalani@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, bleung@chromium.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 2, 2023 at 12:51=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> From: Rob Barnes <robbarnes@google.com>
>
> [ Upstream commit 2cbf475a04b2ae3d722bbe41742e5d874a027fc3 ]
>
> Create a uevent when an EC panic is detected. This will allow udev rules
> to trigger when a panic occurs. For example, a udev rule could be added t=
o
> capture an EC coredump. This approach avoids the need to stuff all the
> processing into the driver.
>
> Signed-off-by: Rob Barnes <robbarnes@google.com>
> Reviewed-by: Prashant Malani <pmalani@chromium.org>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> Link: https://lore.kernel.org/r/20230509232624.3120347-1-robbarnes@google=
.com
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/platform/chrome/cros_ec_lpc.c | 3 +++
>  1 file changed, 3 insertions(+)

What sorcery determined this was a valid for-linux-stable patch? It's
a new feature, and definitely not a for-stable candidate. Please
remove this from the queue.

Brian
