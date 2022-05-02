Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613C82F33
	for <chrome-platform@lists.linux.dev>; Mon,  2 May 2022 17:03:10 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id b24so17302045edu.10
        for <chrome-platform@lists.linux.dev>; Mon, 02 May 2022 10:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/u6ctPDMxVgGjtnFGMUjLT8WYXeEvvG7PHjNe0QwddI=;
        b=U+6pAjMkfydxMfXGeTmt3HKbxbXevcplbal5L1ckkQu9nHhDDr4SDRGgBekVn87CJd
         YrmGEanXaLZSZ82VJResvpoYyRkLUcrMX7ZgkOFM7hnObCOd86KUkbaj6zmv9dig+Cl6
         pXz5+eXdWfU0Vqp7yPjv4dFgsa7Lo+L0IpdMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/u6ctPDMxVgGjtnFGMUjLT8WYXeEvvG7PHjNe0QwddI=;
        b=1tL6z+TweciqfIDs0Sze7/uFDDBWH0uu1cjOs9sO/Xi0e9I0HE6x6FY43EHrSzlfKi
         ikyqBLkNXr0pmen4iHmKt1qFKoPLC0SZ8W+jZLtJZ7ZCVRP7LDhW2oUEIHR0v/crfkYZ
         QpLQsEFtFwKaCNDIlexsmL/er+fyEE+l1pElahOSzcui+xWCWukoTjSsIqdE+A4Lg4vk
         0Lah65Av8rBXFlOAinBxDOHl6X6hjADpAEpYeR6NTcCyZ87LpsgLh+/EJF12483d4o73
         8AbH94YZ4C/zgerkkjBZXFu8q3oWalbYh7MrUK6P/AlhLOYYr8uk2HMT2ZSbuCWSSFzO
         2h2Q==
X-Gm-Message-State: AOAM5332OPxdadYfrC3UW9xgLmqV0+RvDsVPCi2b1rAeaQ+VYTLF6MdY
	1ITcfytBd2O7bckfQts2ru13Z3XY4/nkBSI4
X-Google-Smtp-Source: ABdhPJzVPTD3A8Z1KZgsoy0uRMWyE9USmkvUahlaF6e/0C1+74/f4mFGl7xMhdBXBG/ghn/3jriUXw==
X-Received: by 2002:a05:6402:2318:b0:413:7645:fa51 with SMTP id l24-20020a056402231800b004137645fa51mr14155602eda.201.1651510988481;
        Mon, 02 May 2022 10:03:08 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id hy20-20020a1709068a7400b006f3ef214dcasm3783929ejc.48.2022.05.02.10.03.06
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 10:03:07 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id e2so20320660wrh.7
        for <chrome-platform@lists.linux.dev>; Mon, 02 May 2022 10:03:06 -0700 (PDT)
X-Received: by 2002:a5d:6d09:0:b0:20c:53a9:cc30 with SMTP id
 e9-20020a5d6d09000000b0020c53a9cc30mr9166713wrq.513.1651510986299; Mon, 02
 May 2022 10:03:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220429233112.2851665-1-swboyd@chromium.org> <20220429233112.2851665-3-swboyd@chromium.org>
In-Reply-To: <20220429233112.2851665-3-swboyd@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 2 May 2022 10:02:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WAbfe9BC5QPDezz3FSEwHRFdQeZpARJYT4b9V1rNp_nA@mail.gmail.com>
Message-ID: <CAD=FV=WAbfe9BC5QPDezz3FSEwHRFdQeZpARJYT4b9V1rNp_nA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Input: cros-ec-keyb - skip keyboard registration
 for switches compatible
To: Stephen Boyd <swboyd@chromium.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, LKML <linux-kernel@vger.kernel.org>, 
	patches@lists.linux.dev, chrome-platform@lists.linux.dev, 
	Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	"Joseph S. Barrera III" <joebar@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, Apr 29, 2022 at 4:31 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> In commit 4352e23a7ff2 ("Input: cros-ec-keyb - only register keyboard if
> rows/columns exist") we skipped registration of the keyboard if the
> row/columns property didn't exist, but that has a slight problem for
> existing DTBs. The DTBs have the rows/columns properties, so removing
> the properties to indicate only switches exist makes this keyboard
> driver fail to probe, resulting in broken power and volume buttons. Ease
> the migration of existing DTBs by skipping keyboard registration if the
> google,cros-ec-keyb-switches compatible exists.
>
> The end result is that new DTBs can either choose to remove the matrix
> keymap properties or leave them in place and add this new compatible
> indicating the matrix keyboard properties should be ignored. Existing
> DTBs will continue to work, but they will keep registering the keyboard
> that does nothing. To fix that problem we can add this extra compatible
> to existing DTBs and the keyboard will stop being registered. Finally,
> if google,cros-ec-keyb is missing then this driver won't even attempt to
> register the matrix keyboard.
>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: <devicetree@vger.kernel.org>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Hsin-Yi Wang <hsinyi@chromium.org>
> Cc: "Joseph S. Barrera III" <joebar@chromium.org>
> Fixes: 4352e23a7ff2 ("Input: cros-ec-keyb - only register keyboard if rows/columns exist")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/input/keyboard/cros_ec_keyb.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
> index eef909e52e23..1bbe2987bf52 100644
> --- a/drivers/input/keyboard/cros_ec_keyb.c
> +++ b/drivers/input/keyboard/cros_ec_keyb.c
> @@ -536,6 +536,12 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
>         u32 *physmap;
>         u32 key_pos;
>         unsigned int row, col, scancode, n_physmap;
> +       bool register_keyboard;
> +
> +       /* Skip matrix registration if no keyboard */
> +       register_keyboard = device_get_match_data(dev);
> +       if (!register_keyboard)
> +               return 0;
>
>         /*
>          * No rows and columns? There isn't a matrix but maybe there are

As per my comments in patch #1, I wonder if it makes sense to delete
the "No rows and columns?" logic and settle on the compatible as the
one true way to specify this.

-Doug
