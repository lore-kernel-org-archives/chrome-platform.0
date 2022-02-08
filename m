Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645CC2C9C
	for <chrome-platform@lists.linux.dev>; Tue,  8 Feb 2022 11:16:02 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id p22-20020a17090adf9600b001b8783b2647so1752345pjv.5
        for <chrome-platform@lists.linux.dev>; Tue, 08 Feb 2022 03:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=P3thgQ+zSj04vKKZCiXaKT5NnbhXmsspNLhy1DSjGPo=;
        b=iZ3nawHHxyXLGpoHI81EkPmFqhuqUTCmnIohINaeXf2No0Gz3tGSoFBFxXJxk00a2k
         lMMbPSFim/wvaISL97bc7/TcCn7r2hD4lThZg8qosb02ebUOmnlAeNWXAZA0uajJIzT/
         YnzsEzWlwXXHCsV3YzSB4f2hBBoBZvrORTEBU1YrihaVEveHDVz6R2AHl3biSPJIF4yJ
         w/h7CNDMBgdAsVbWFzx5XiCsObhtKGoL+DYAj5MWj61g1u2hxynX4wTkn8Wj6BRgQM5l
         SN0QHy99TZJpc1xm0FeK/UtW3ssSWUfBT5RjglqJD3L6sEctWSVKtKmG1EjMW3YjIz0R
         BIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=P3thgQ+zSj04vKKZCiXaKT5NnbhXmsspNLhy1DSjGPo=;
        b=yfaJtxaCK34YsK7BEbpfUgbkeL2OBxyssPiL/pQLP9+9p/IUL12IwnaycmD1PhrGVV
         K84bHpzs2WIZ3ThAXICgIWN5gRylZbpf6AukdLEQLcl8M/STaisiTfD68Y/xRozrPoOf
         BqA+4ra5N2jRsqMvZgy4hNuzZsP8WalSRRjrqckP8rUrn5WEajSD++yS65dNx/XMWbPu
         s/qYT5gKDontgA0XD8l21QpZ1uEkizjETzMoHpoKxK5j2gsOuNjl5JAOrX5qWNPW8to0
         kvBI0P6mO+a3Ud3NJX39eQ/xrZGHGyeimNuaVk2smk97oVmr5kkLahr7h8gjVH2pUFi6
         nAcg==
X-Gm-Message-State: AOAM5319EE3JIJXDKWyvUNE3KL7c8p8zkMfFfY4YVVJGULje6Mz5I0SU
	Fg87I3sfzqtMbpcG+qWefpGpnA==
X-Google-Smtp-Source: ABdhPJzk07GU3cOQZXIPEWFkIrBzO0AzeU+5y72yavAhuejps6giNLBY5vTrlvpus7PFKbFyb6PqkA==
X-Received: by 2002:a17:90b:4b52:: with SMTP id mi18mr811701pjb.74.1644318961662;
        Tue, 08 Feb 2022 03:16:01 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:4b6f:f14d:be50:86a])
        by smtp.gmail.com with ESMTPSA id h11sm14734018pfe.214.2022.02.08.03.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 03:16:01 -0800 (PST)
Date: Tue, 8 Feb 2022 19:15:58 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	"open list:CHROMEOS EC USB TYPE-C DRIVER" <chrome-platform@lists.linux.dev>
Subject: Re: [PATCH 4/4] platform/chrome: cros_ec_typec: Update mux flags
 during partner removal
Message-ID: <YgJQ7nvYivWozvdT@google.com>
References: <20220207214026.1526151-1-pmalani@chromium.org>
 <20220207214026.1526151-5-pmalani@chromium.org>
 <YgIB8N6fjxWcKK9/@google.com>
 <CACeCKafPyaT9-raroFh-UTunq93Yvh-uPb29oF9NbGZRZjv=Yw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACeCKafPyaT9-raroFh-UTunq93Yvh-uPb29oF9NbGZRZjv=Yw@mail.gmail.com>

On Mon, Feb 07, 2022 at 10:15:12PM -0800, Prashant Malani wrote:
> On Mon, Feb 7, 2022 at 9:38 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
> > On Mon, Feb 07, 2022 at 09:40:30PM +0000, Prashant Malani wrote:
> > > In cros_typec_remove_partner(), we call
> > > cros_typec_usb_disconnect_state() which sets the switches/muxes to be in
> > > a disconnected state. This also happens in cros_typec_configure_mux().
> > > However, unlike there, here the mux_flags variable hasn't been updated
> > > to reflect that a disconnection has occurred. Update the flag here
> > > accordingly.
> >
> > It is fine (at least to me) usually.
> >
> > Since you would need to respin the series anyway, s/Update/Updates/.
> 
> Again, "update" is fine. Please see:
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes
> 
> Quoting from the above: " Describe your changes in imperative mood,"
> 
> So, imperative usage is actually preferred, and "updates/makes" is discouraged.

Ack, thanks for correcting my so-long-time misunderstanding.
