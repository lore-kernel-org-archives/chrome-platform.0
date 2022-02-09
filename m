Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CB42F21
	for <chrome-platform@lists.linux.dev>; Wed,  9 Feb 2022 06:09:11 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id y6so3122681ybc.5
        for <chrome-platform@lists.linux.dev>; Tue, 08 Feb 2022 22:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AStNDph4mSfGlj2UV9A+YAMf9CSCtJksjJC273y7bE8=;
        b=DAJe80EHdC18p4x6DAP53gYb6Eq5exHIL5T21YOySBTY4YVZ9w3Yc+42ZCqMQAfpy0
         rjtm+9CylkXFHpTv19XU4iccjyNh3AMivNxIGu1EUH2XsgSsDNcsyKtS49t0NiZZjb54
         mOGs79+nwscPt41kzonDddWkI12mVeqYIyhTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AStNDph4mSfGlj2UV9A+YAMf9CSCtJksjJC273y7bE8=;
        b=gRnzQOcTCNBKnw/zvHTOCduzDQoSLocICRT2cDswsd3shXJVugzH6YJovpiPGDc5IN
         StkOtZwpFFh7PrLm9rj91A4Ree9gz03DwYH7zutVfJpcBxjeGpyWCEnEtX1TwP2bEgj3
         3dC3GxEYrd14Py96Lk0qTrjlaSeKpoRnnXL16bJ1OGTvxy2iZeHhDpPnylmtptPtFKyU
         IdvuGv3arGyhtue8RYWzib4tRv7/HNQAoTcdvQjqKthBC5wwb35GuTEdT51lhJjdB2c3
         Eh+Lod1f5TXunT2x9g6bdA3AFFc6zVclE84nRYKXmYFJ9RyoeD+Yr2eb5bPdIMu2IRE6
         hFGw==
X-Gm-Message-State: AOAM531V8C61wMAXEClJ+7bkHsIMvFbtdUkzwPaUSG2AdjX4xeGjV6qM
	CA4YSGWa/J8Jq/mh6BxVfRhZt2BPOgtMY/mPfEZhQg==
X-Google-Smtp-Source: ABdhPJw2rUKhDlmROg69Bu0Imj+eWwESykwGsu0nsCBANoG4VTjumd7fa29v8xPeHA6iaMSRpdceabLve1aeEKScW1w=
X-Received: by 2002:a81:af1f:: with SMTP id n31mr641851ywh.350.1644386949750;
 Tue, 08 Feb 2022 22:09:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220209045035.380615-1-tzungbi@google.com> <20220209045035.380615-5-tzungbi@google.com>
In-Reply-To: <20220209045035.380615-5-tzungbi@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 8 Feb 2022 22:08:59 -0800
Message-ID: <CACeCKaeRz2D-DdPRHbrvywTMr2w-MPuGZ+-mBhNtWCapgm=ZXw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] platform/chrome: cros_ec: don't initialize `err`
 in cros_ec_register()
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, Feb 8, 2022 at 8:51 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> `err` in cros_ec_register() doesn't need to be initialized.

What is the issue with it being initialized to 0? This doesn't strike
me as necessary.
