Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14ECD8F6F
	for <chrome-platform@lists.linux.dev>; Thu,  8 Dec 2022 19:46:47 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id i12so1681296qvs.2
        for <chrome-platform@lists.linux.dev>; Thu, 08 Dec 2022 11:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7mIqjTs/J5VBq6iJHSHqEcNWDxeU/mGu9PhAREI+OiI=;
        b=WeCxlyGyutfHNtQzCnaGUZ315e8wMBAmxzoYDDjbGm9Mm1LETQRHdEVZkJX0e/wLeP
         01bReuR0Jtt2qAMSxUh3atHt8wHyqtb45RI4sXZpxu3CU+d0T0zKVsZo0EsmbP1XVRVu
         pt5rh8iUMigabiSAYKOKx4vQnn6/wkK+fcfVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7mIqjTs/J5VBq6iJHSHqEcNWDxeU/mGu9PhAREI+OiI=;
        b=fNMek9F8FilCLaygKV+fxr/vAUGZaE+zuUyAaBRgDCFWdBleOdh8XrU4XmUOYv+8lX
         CFQPQQzYbmud0QQKMA8KFIv8DYFHIi/UYfzkh6r1SGdMvut8Mk7Nxl0rQkZdtR+LASv4
         JVq44CAUGGd8lNtEQ3oNNv5vcrkA3x8l8GAJbM3UGGnQHNpIl2WEpw0mGTEi3YAggG2s
         RLrfYziAOjh2Ms/lTykrU3USVbD+ZTkVLPN82GrsepuBuMCBEawo9cSBvS2wktPEfk3u
         IqIvrEUO6YgsjaFFQgBq6oI3+oj7hXk0BwbJLu2bAFw7LGH6Luy2H3lmkkJPPVsaVR2U
         GU/Q==
X-Gm-Message-State: ANoB5pnWKJ+Gb9uQH5Odzrd4skt4RohrahyAE/fq/f5oorLZmH4SdYH6
	WXf5u2Nc+ubljCZBLxYi9oLZcF9rU4vbdb9/q3/jNA==
X-Google-Smtp-Source: AA0mqf6QyZoEfsAzuEU2ETbBDQlwNTZDY34YWQZ8lIEtxA40aC2MNn/ZM36u7ELmoYeVJc6knTPxyoYlj98JzAs7wLE=
X-Received: by 2002:a05:6214:1e2:b0:4c6:8f31:2dea with SMTP id
 c2-20020a05621401e200b004c68f312deamr69129323qvu.127.1670528806959; Thu, 08
 Dec 2022 11:46:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221208123944.v11.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
 <20221208123944.v11.3.Ie23c217d69ff25d7354db942613f143bbc8ef891@changeid>
In-Reply-To: <20221208123944.v11.3.Ie23c217d69ff25d7354db942613f143bbc8ef891@changeid>
From: Prashant Malani <pmalani@chromium.org>
Date: Thu, 8 Dec 2022 11:46:36 -0800
Message-ID: <CACeCKacPeFFR_bqWhSh+e5amOrfn+Jfzy1LFLQdYo5WsuvX7xA@mail.gmail.com>
Subject: Re: [PATCH v11 3/3] platform/chrome: cros_ec_uart: Add DT enumeration support
To: Mark Hasemeyer <markhas@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Raul Rangel <rrangel@chromium.org>, 
	Bhanu Prakash Maiya <bhanumaiya@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 8, 2022 at 11:40 AM Mark Hasemeyer <markhas@chromium.org> wrote:
>
> From: Bhanu Prakash Maiya <bhanumaiya@chromium.org>
>
> Existing firmware uses the "PRP0001" _HID and an associated compatible
> string to enumerate the cros_ec_uart.
>
> Add DT enumeration support for already shipped firmware.
>
> Signed-off-by: Bhanu Prakash Maiya <bhanumaiya@chromium.org>
> Co-developed-by: Mark Hasemeyer <markhas@chromium.org>
> Signed-off-by: Mark Hasemeyer <markhas@chromium.org>

FWIW:
Reviewed-by: Prashant Malani <pmalani@chromium.org>
