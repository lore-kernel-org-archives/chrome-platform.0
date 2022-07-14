Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8116002
	for <chrome-platform@lists.linux.dev>; Thu, 14 Jul 2022 17:02:43 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-31caffa4a45so23601997b3.3
        for <chrome-platform@lists.linux.dev>; Thu, 14 Jul 2022 10:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qtK8JWxmh8q5x5mO5HKZTmWYXVBtIH5ikPi8Wy+gYMM=;
        b=E5mRlU4YdLivxzyaoEtuezS+Jtt7mY/sjICKjY8rfA/5Hio8aVxjqIJ94Gd+8yucJs
         VnhiykLwDQxlI64fycNCOI4gzCStjgGAnV0vlAIOmg1/v3ECoPqdBat2KOX+fAxTalH1
         /+7+bFTCU77K/CocLn+YYSABxxeSEYdZ6gF+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qtK8JWxmh8q5x5mO5HKZTmWYXVBtIH5ikPi8Wy+gYMM=;
        b=dIZUdGdyNb1dOFoieEpLOTjHf9cdVi8CfC4omOJ29GJYt5vOw7PjqeaTSiHlO8NQg+
         Amkeq7hkA7li5Ha/BFjXLRRsvEp1n+aPTsXw5i4EpglOqzCkRnnqrN0sIKJyfQwe4mwh
         1p40zrpXKrUKmEyCKZHYPja5e8rA5Zl7JT7NSeOm3B+CxG4bPgC6l24OHxYBwxbcYHtR
         k96LB/k7dtu6L1VsfQOqfXAnmVnOVDjwybb/dms9erqeWY6PsuEXZgRScwv2vCQ3WU9F
         GOGg10nmHA4z65qdxzqfx/n5B2wlKji/98NiXACKD19MbGV/1XzJmN1KZhY9EB2ltzz1
         FL4g==
X-Gm-Message-State: AJIora9YSq4/z0u5xrlcmO0Kbak9db7SavC/F/ct8e94So0lcJI620rL
	qGOQ/iLgc6HjvFtKVEogNIUZg5dHngwOKGF1IiGX9g==
X-Google-Smtp-Source: AGRyM1tl9TTfRVYxTb3SUNeA4pfUuj3s8pzE/79IWe7n/UP0VoNGNinQM5IVUwftl0kpeY4bG+r4nvRTrmm38DonMWI=
X-Received: by 2002:a0d:c787:0:b0:31b:a963:e1de with SMTP id
 j129-20020a0dc787000000b0031ba963e1demr10578743ywd.283.1657818162816; Thu, 14
 Jul 2022 10:02:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220711072333.2064341-1-pmalani@chromium.org> <YtAkeQ1Do7CuM/PR@kroah.com>
In-Reply-To: <YtAkeQ1Do7CuM/PR@kroah.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Thu, 14 Jul 2022 10:02:32 -0700
Message-ID: <CACeCKaekD4S93XbYGOia+vuCwc+oRJpcNKVgrxEasa4MDGsSoQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] Type-C switch driver and Type-C framework updates
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, bleung@chromium.org, 
	heikki.krogerus@linux.intel.com, Daisuke Nojiri <dnojiri@chromium.org>, 
	"Dustin L. Howett" <dustin@howett.net>, Guenter Roeck <groeck@chromium.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

On Thu, Jul 14, 2022 at 7:15 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jul 11, 2022 at 07:22:54AM +0000, Prashant Malani wrote:
> > This series introduces a retimer class to the USB Type-C framework,
> > It also introduces a Chrome EC (Embedded Controller) switch driver which
> > registers the aforementioned retimer switches as well as mode-switches.
> >
> > Patch 1 and 2 introduce the retimer class and associated functions to
> > the Type-C common code.
> >
> > Patches 3-7 add the cros-typec-switch driver.
> >
> > Patches 8-9 update cros-ec-typec to get and use retimer switch handles.
> >
> > Submission suggestion (as always, open to better suggestions):
> > - Patch 1 and 2 can go through the USB repo.
> > - Patch 3-9 can go through the chrome-platform repo. Since they depend
> >   on patches 1 and 2, we can create an "topic branch" off of usb-next
> >   once Patch 1 and 2 are submitted, and then apply Patches 3-9 on top
> >   of that "topic branch" before merging it back into chrome-platform's
> >   for-next branch
>
> That's a mess, I can just take all of them into my tree if you want.

That works for me. Thanks for taking Patch 1 and 2; it should be fine
to apply the rest of the patches to your tree too.

Best regards,
