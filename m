Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092A06AA9
	for <chrome-platform@lists.linux.dev>; Tue, 16 Aug 2022 21:45:42 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-32fd97c199fso161120947b3.6
        for <chrome-platform@lists.linux.dev>; Tue, 16 Aug 2022 14:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=E+UpqcFwgELt9+6MJIAJVd5JzMPdNiyIwaSeI8WmY6M=;
        b=Mt2RG2AE03PBhIhHfekRlsuDB0YqsgZhUuqVmdXQAKDRDmSL4bq8wec47PSx5Fjvjg
         GEodI/dqr8I7fvbcCyGjMakpznZofiAXvPB57TvLyxO1gCn2o+TerGc6xtNjkPGHNpnJ
         Dg31DNDB88B2xrcbcNouv9JcU/t8h0Q/zATNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=E+UpqcFwgELt9+6MJIAJVd5JzMPdNiyIwaSeI8WmY6M=;
        b=PanwbhYbTJqLdDYveEWULzBx8kfiq7mgS/V2dnIEv62/eZ0YGKvYBHxR01BMAfo6iT
         VHJU6H92+GMvQLX7oKx5HnNxtfJ1nGqntTA1bciqCyyzNJztRHgpM4E7vUqt9/fYX2Fv
         BFt3QvKtyyTBIJsyg3VUfpjjLdmtu7lkA1relTWT/gBQY+DvWrKahCdiBeQlus8tz20i
         jg6wiu//IJZuDPNRNJvhD6xCHG4TaixV67XJoN+Z1asZ3N11LHKQMsrKq2a8drFEfYEd
         qQUZGS4cDPE3yFolpdR3cXK3++GMHxjMPATAs1E9tSOtjMR03KMbajJLLK43CrXcIqjc
         sBLg==
X-Gm-Message-State: ACgBeo1H1p9SUIe/or93h1Qe2nrcXmeefYEWx/QSvGIA6lQE1p0b/HbI
	7EUNYOyb1ujrkU50keoNAmVVwwpOErEyWV8/koG89w==
X-Google-Smtp-Source: AA6agR6xkEO0vUoHT/2LMaG3iIZe2zaePbLtIrzuzhHhZJXzy89lBKkDy6ybOVhCy/748r/hMEfqnzDn4hYVm26PV/g=
X-Received: by 2002:a81:84cf:0:b0:324:d62c:aee with SMTP id
 u198-20020a8184cf000000b00324d62c0aeemr18697266ywf.489.1660686342014; Tue, 16
 Aug 2022 14:45:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220815063555.1384505-1-pmalani@chromium.org>
 <20220815063555.1384505-6-pmalani@chromium.org> <YvsnRXLVbcI+McEo@google.com>
In-Reply-To: <YvsnRXLVbcI+McEo@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 16 Aug 2022 14:45:31 -0700
Message-ID: <CACeCKaemEZV4BZetUQmsWF-SAArQDkzmtszD6jDxsvhqLAxLPA@mail.gmail.com>
Subject: Re: [PATCH v5 5/7] platform/chrome: cros_typec_switch: Register mode switches
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	bleung@chromium.org, Daisuke Nojiri <dnojiri@chromium.org>, 
	"Dustin L. Howett" <dustin@howett.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Guenter Roeck <groeck@chromium.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Kees Cook <keescook@chromium.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Tinghan Shen <tinghan.shen@mediatek.com>, Xiang wangx <wangxiang@cdjrlc.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 15, 2022 at 10:12 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> On Mon, Aug 15, 2022 at 06:34:26AM +0000, Prashant Malani wrote:
> > Register mode switch devices for Type C connectors, when they are
> > specified by firmware. These control Type C configuration for any USB
> > Type-C mode switches (sometimes known as "muxes") which are controlled
> > by the Chrome EC.
>
> To be consistent to the commit message, s/Type C/Type-C/g.
>
> To be consistent to the series, I guess you would like to use ChromeOS
> instead of Chrome?

Done.

>
> > @@ -235,6 +264,17 @@ static int cros_typec_register_switches(struct cros_typec_switch_data *sdata)
> >               }
> >
> >               dev_dbg(dev, "Retimer switch registered for index %llu\n", index);
> > +
> > +             if (!fwnode_property_read_bool(fwnode, "mode-switch"))
> > +                     continue;
>
> Would it be better to use device_property_present()?

Fixed in v6.
