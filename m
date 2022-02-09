Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3B22C9C
	for <chrome-platform@lists.linux.dev>; Wed,  9 Feb 2022 03:32:32 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id e28so1973593pfj.5
        for <chrome-platform@lists.linux.dev>; Tue, 08 Feb 2022 19:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GOQ0sWfM4FjwKkl33/hNhQ8lpkr9qvoQNXOdfZoCGy4=;
        b=WPh+JZAupBRMfuEu+D0pwyvzDFFX2NJCAoSOCCWQY+6t/ldquzG3RHI7/JWZGyQRL6
         e27N96UhOUznbX4Y6v3TO/ES3k7XZKupg6PrNvOAJd4yUlz4Z17JwkMvC7cs4EGVkaoX
         4HJFcQ3I+gkEgMhvujrfc/e64hKNNB26SLuBnYBPWyAKEKCPwSmzK4qroViO9xXNw5Zp
         hAJ2sRdkv0I610ubtyoyf5X+lpG5oXvCvsqBf6SLMuxjMIruVcpoVxe6xaxcEN+GTLmb
         dg4U8hSC+7xN9EtudaCVc60tZpjJV5Wi/D3p8Oac+Yj6D3FfnjyATGsODsZwd22wAKPX
         +EQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GOQ0sWfM4FjwKkl33/hNhQ8lpkr9qvoQNXOdfZoCGy4=;
        b=0lw0BaW29je6/Oa/N7iKjATWSPlGJo+BErEpk9EyGUQNslrL0lOr75FQ3pl8R3ArvU
         7gjBeV/xhP8Jy2miD4n9Zp9avb43iFlpXrTld+DWWdPnQn4qzjOZ7uiTjmXsWMLPN2G0
         WCoswje3VDNsBEOyYsHJHSRmKIlLodZU5RC6Rn6/Qemm6551/0nVxvJSu3zo2oxBYqcZ
         QO94YGHYddV+iDftAtogG51bYC5crhydSspFA7a3CgY1GqppbjkLxPwNsZ+Enhwa9ZGD
         vAL7mDpQ8LKm2K+Vj3YsP7mEDZNdHUo23Oz8iU+OOIPSqx+eVNOcIToOT+VS2yhv/Gpw
         ISFw==
X-Gm-Message-State: AOAM531GcIma+dy3Lnh9yFl2dV2TLERz3eufKAhJOyrTxScBFdyWNMxU
	uS6p0E1KcddmkT8t+6oRyAGhbg==
X-Google-Smtp-Source: ABdhPJz51Gwp5ZjbgRK9o+938031p99GlYbBhM3IxPTtiQ0jNOjrMfO/AhFmHZFU+kutJ57icCkOEA==
X-Received: by 2002:a63:6a06:: with SMTP id f6mr364233pgc.576.1644377551404;
        Tue, 08 Feb 2022 19:32:31 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:4b6f:f14d:be50:86a])
        by smtp.gmail.com with ESMTPSA id y193sm18393977pfb.7.2022.02.08.19.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 19:32:31 -0800 (PST)
Date: Wed, 9 Feb 2022 11:32:28 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	"open list:CHROMEOS EC USB TYPE-C DRIVER" <chrome-platform@lists.linux.dev>
Subject: Re: [PATCH v2 4/4] platform/chrome: cros_ec_typec: Update mux flags
 during partner removal
Message-ID: <YgM1zM7Vpn/FlHv7@google.com>
References: <20220208184721.1697194-1-pmalani@chromium.org>
 <20220208184721.1697194-5-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220208184721.1697194-5-pmalani@chromium.org>

On Tue, Feb 08, 2022 at 06:47:24PM +0000, Prashant Malani wrote:
> In cros_typec_remove_partner(), we call
> cros_typec_usb_disconnect_state() which sets the switches/muxes to be in
> a disconnected state. This also happens in cros_typec_configure_mux().
> However, unlike there, here the mux_flags variable hasn't been updated
> to reflect that a disconnection has occurred. Update the flag here
> accordingly.
> 
> Signed-off-by: Prashant Malani <pmalani@chromium.org>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
