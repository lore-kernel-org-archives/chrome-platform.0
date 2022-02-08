Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFDD2F2C
	for <chrome-platform@lists.linux.dev>; Tue,  8 Feb 2022 06:03:32 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id v47so21892517ybi.4
        for <chrome-platform@lists.linux.dev>; Mon, 07 Feb 2022 22:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kMy2hRWsW4BXhakNBZo4Ma5dYlVtSB1pupcqWZPcuMI=;
        b=kvk1jcZaq+k/Iwu3RIeroimUiDS+lPWwHyJtqt4TLLIy5da2ssF18ys78lP1+rVg0Z
         pSpTWY0jk82CS/yXxgIwVnRerVRQEOWD3HVuX44bGybNPpsW+OTzfZwDWLcb5VptzK+O
         lmbVPl2qu8GdgocQk9tsmwzO7yGYPJmoWU8+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kMy2hRWsW4BXhakNBZo4Ma5dYlVtSB1pupcqWZPcuMI=;
        b=Jl5wsnLv5V6hMRh5cLjffT8CBcR+MU9kjjXrjWco119keOZtKhHorRd/Ss4JgkcmxE
         0qM+7PsQ+RNNG7NeqxVji5JRrHd0OQXyD7P8Goc+63m1ikb1PEET9j1/iUh8shimjDh9
         za6/9j70G+USxTHmJuTexDCTP3j1/CUplgyFNYBTvqo3QdPyg/JUniZcnmXNsMf6G2eK
         gVc8fbHAeI3dpDTccISXDBqP6rxSXCCHliFLgqQTMpheAatqK2pnwWbTBpRhVSERTj+y
         rT5WtVa6PhjfbXm2FZBfBjXtUcc4bC/VC/v3OIBIPnxLlNz/9t4kCv7gbZT5e1R/WaLZ
         26JA==
X-Gm-Message-State: AOAM533Cis7aKDoJKQFiVDJ9Q6kfGJpulsZfTc7K0xgsZLQDT6m+GM2e
	BphhydVVjcXyVlw6NeF3bvTObL3yMKmnID/pOFCm3g==
X-Google-Smtp-Source: ABdhPJzLJ+I6iKDCyYDLbD3jS0wm/Y7PBtmB4ohNMMY4516lTpj2oaCH6aihTPhiO0sYKMvXLFdQcjhnENV2mU7pJSI=
X-Received: by 2002:a25:be43:: with SMTP id d3mr3132634ybm.454.1644300211036;
 Mon, 07 Feb 2022 22:03:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220207214026.1526151-1-pmalani@chromium.org>
 <20220207214026.1526151-2-pmalani@chromium.org> <YgIAl8do1/b1Dru9@google.com>
In-Reply-To: <YgIAl8do1/b1Dru9@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Mon, 7 Feb 2022 22:03:19 -0800
Message-ID: <CACeCKafU5OgwidJJ5TeBani-gfBTo-Qk0fXi7n=r6pLkTK7ApA@mail.gmail.com>
Subject: Re: [PATCH 1/4] platform/chrome: cros_ec_typec: Move mux flag checks
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: linux-kernel@vger.kernel.org, Benson Leung <bleung@chromium.org>, 
	"open list:CHROMEOS EC USB TYPE-C DRIVER" <chrome-platform@lists.linux.dev>, Guenter Roeck <groeck@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Tzung-Bi,

On Mon, Feb 7, 2022 at 9:33 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Mon, Feb 07, 2022 at 09:40:24PM +0000, Prashant Malani wrote:
> > Move mux and role flag checks inside of cros_typec_configure_mux(),
> > which is a more logical location for them.
>
> nit: s/Move/Moves/.

Move is fine. Please see:
https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html#describe-your-changes

Quoting from the above: " Describe your changes in imperative mood,"

>
> > @@ -519,7 +519,14 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
> >       struct cros_typec_port *port = typec->ports[port_num];
> >       struct ec_params_usb_pd_mux_ack mux_ack;
> >       enum typec_orientation orientation;
> > -     int ret;
> > +     int ret = 0;
>
> The change looks irrelevant to the patch.
Ack, I missed eliminating this while cleaning up the patches. Will fix
it in the next version.
