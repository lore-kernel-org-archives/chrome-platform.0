Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A421829CA
	for <chrome-platform@lists.linux.dev>; Tue,  8 Feb 2022 05:38:59 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id i186so17059674pfe.0
        for <chrome-platform@lists.linux.dev>; Mon, 07 Feb 2022 21:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=w1ToBKvilZAnLsl88mTOhBoWn6o9AUkKYUjyzTMC1uc=;
        b=CJFYtc43lHuyGmlpLrVF+z71pylI0Zj0Gmg7Be1LIE6/wkILXgk5t4MJPAxctlpTwe
         92Ha5dQKE8WgrirZAcawdCkKEv500hRdAyExKqhtObw+9Fhh3a5OQxHG3sz1FW3Hhmjb
         ts5cAgKY60ZWOtTBKCWtatzkOkGUhyhME6yZjCvA79/k19ve5pQhOOhqL2TnjQUUN7/i
         P5p5ce2gFs7yr2JbnBpp0W/jgyqIRVHuYAggKMArpvSKpnNpWQtuTayqLrAxMKEHImwT
         sqp15upJV7ETX3PgRbL9MiCSTcCCUkYiVRfhmDS/avPr0/NQh1egHiqMY8DFFIwCoHfI
         ivPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=w1ToBKvilZAnLsl88mTOhBoWn6o9AUkKYUjyzTMC1uc=;
        b=Zsnu7Ox0LMg4Eo/yPIwyRP8uHkSnNPooSU7Da2AZA6/E1pSyqu+Aoym9ds+DtdbzE6
         Zre09J7EdoD9Xxo7RyLoQprTMusheQ7nywR/V6olAjpNwlln6RyV+J8JwPLdBUnFMhUW
         mj+WYdFpm0DC3GTnjN55hL3gExWKCPoE1T7/qJPEGB2OCbCEAE1zxYAqktbEoArVsKDa
         Cwip949ku9jC5ZRtghvynU1dJZAsfP0fcmyGrPkGTewAG9Yod1NWnXuIGxDt0Iwo5otW
         wMBC8qWA0wxJ1gyqpnxOdKKi+8kkVqVtMH+WVOX138odOZPJgIndKKzwssP0Q0MGu8xf
         oolA==
X-Gm-Message-State: AOAM532DbuyR6hHzTB5tj+1G7uz/bewtNC4estnUGgQKdYIwOMff+q4T
	M5QgAwmUacz0X6mMDnyNLLfzjw==
X-Google-Smtp-Source: ABdhPJxRH3e1fGO47pLA/QC1IV9ZXOj10+7A2obM7eqTYRXXCvlPNG6xSLseIw68AtvgSfd/70PyeA==
X-Received: by 2002:a63:36c8:: with SMTP id d191mr2247795pga.377.1644298738976;
        Mon, 07 Feb 2022 21:38:58 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:4b6f:f14d:be50:86a])
        by smtp.gmail.com with ESMTPSA id k9sm14548102pfc.157.2022.02.07.21.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 21:38:58 -0800 (PST)
Date: Tue, 8 Feb 2022 13:38:56 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	"open list:CHROMEOS EC USB TYPE-C DRIVER" <chrome-platform@lists.linux.dev>
Subject: Re: [PATCH 4/4] platform/chrome: cros_ec_typec: Update mux flags
 during partner removal
Message-ID: <YgIB8N6fjxWcKK9/@google.com>
References: <20220207214026.1526151-1-pmalani@chromium.org>
 <20220207214026.1526151-5-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220207214026.1526151-5-pmalani@chromium.org>

On Mon, Feb 07, 2022 at 09:40:30PM +0000, Prashant Malani wrote:
> In cros_typec_remove_partner(), we call
> cros_typec_usb_disconnect_state() which sets the switches/muxes to be in
> a disconnected state. This also happens in cros_typec_configure_mux().
> However, unlike there, here the mux_flags variable hasn't been updated
> to reflect that a disconnection has occurred. Update the flag here
> accordingly.

It is fine (at least to me) usually.

Since you would need to respin the series anyway, s/Update/Updates/.
