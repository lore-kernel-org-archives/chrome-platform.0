Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1863D8F4B
	for <chrome-platform@lists.linux.dev>; Wed,  7 Dec 2022 22:54:19 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id d3so18446883plr.10
        for <chrome-platform@lists.linux.dev>; Wed, 07 Dec 2022 14:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X95/3NyG/PFSS/i+8U7qOxb5jThhUkb5XEu6rEhsTrU=;
        b=Z7haVOgwEq5sAekY9q8Ah2yUkKEM7ScPk7TCouLeeQ6VRp+7x0O5YnnThjcPvw9eL3
         KOnmJ5C4cR+91vITC1Nt3f9pptmGwBqGffqt1VXnfm1Imi16sADA39GBVPxU/1nDNWA0
         kABjSVNBjxJcMkXHy/SGtUrTZHa0bCcf5WYAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X95/3NyG/PFSS/i+8U7qOxb5jThhUkb5XEu6rEhsTrU=;
        b=J/lgtjiHCip3P7znP1h+XRm2/XGVwe24d0krhjKFXn5WRtqOinvssvuFywj1LBi3XN
         MGEYijRHoIJpmRlQ2N6JXjsR315ZLLDbpoHfICcseSg7K0w3txul2Q22wbvjbSZvUskz
         g78BpIsEcsds7+cmlIzuC1eIb3ar3zC9jD42WauIVWbn1+3VnwEHyEzA2HS/Jndu1m7I
         qlugP1DXk0AgiHAxYzdC5n6bI+GxmrixNk9WzAbcCG/a6WxGkwbCppX/4iAdmee9NnQE
         GPkwNOe0ER8/aBll2CEGESlqV2IxDXu+0SAKcpp85pxn5shJ2HueIWgY0pjWlbybiQcR
         xdCA==
X-Gm-Message-State: ANoB5pk31wuTLHlEUIS42HAPx5qOsn5k0hry0CaHJQIO8xcEsMhIuz9a
	UC7TTnHOsiffxGidNB8XpqPsCw==
X-Google-Smtp-Source: AA0mqf4KODRFHXuxWbkkNT/qeEQ77F4Z9AxFhfXBiw0kmuY9J9oZiSPLig3c4735F3k64jx8jjIwsg==
X-Received: by 2002:a17:90a:ff04:b0:219:eeb9:943f with SMTP id ce4-20020a17090aff0400b00219eeb9943fmr998410pjb.49.1670453659460;
        Wed, 07 Dec 2022 14:54:19 -0800 (PST)
Received: from chromium.org (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id lj9-20020a17090b344900b002139459e121sm1647137pjb.27.2022.12.07.14.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 14:54:18 -0800 (PST)
Date: Wed, 7 Dec 2022 22:54:17 +0000
From: Prashant Malani <pmalani@chromium.org>
To: Victor Ding <victording@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	groeck@chromium.org, dustin@howett.net, gustavoars@kernel.org,
	gregkh@linuxfoundation.org, sebastian.reichel@collabora.com,
	dnojiri@chromium.org, lee.jones@linaro.org, bleung@chromium.org,
	tinghan.shen@mediatek.com, tzungbi@kernel.org,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v2] platform/chrome: cros_ec_typec: zero out stale
 pointers
Message-ID: <Y5EZmSSbOFRpfBNj@chromium.org>
References: <20221207093924.v2.1.I1864b6a7ee98824118b93677868d22d3750f439b@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221207093924.v2.1.I1864b6a7ee98824118b93677868d22d3750f439b@changeid>

On Dec 07 09:39, Victor Ding wrote:
> `cros_typec_get_switch_handles` allocates four pointers when obtaining
> type-c switch handles. These pointers are all freed if failing to obtain
> any of them; therefore, pointers in `port` become stale. The stale
> pointers eventually cause use-after-free or double free in later code
> paths. Zeroing out all pointer fields after freeing to eliminate these
> stale pointers.
> 
> Fixes: f28adb41dab4 ("platform/chrome: cros_ec_typec: Register Type C switches")
> Fixes: 1a8912caba02 ("platform/chrome: cros_ec_typec: Get retimer handle")
> Signed-off-by: Victor Ding <victording@chromium.org>
Acked-by: Prashant Malani <pmalani@chromium.org>

Hey Tzung-Bi, it looks like you've already created a tag for the
v6.2 pull request, so I don't know if it's too late to apply this
for the current dev cycle.
So, I've not applied it, but have left the Acked-by tag.

Please feel free to apply it if there's still room for it before
you send out the pull request.

Thanks!
