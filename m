Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5163229
	for <chrome-platform@lists.linux.dev>; Fri,  8 Jul 2022 17:24:39 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id l124so13655646pfl.8
        for <chrome-platform@lists.linux.dev>; Fri, 08 Jul 2022 10:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=taVVHXZCysabggYX/eGgapEaTg3NQMt2ZeKA+oMMy3I=;
        b=fAsZ5jvViNUtezuqqF/z3RUkuZym6HT9+JtV717t7DrssVArf5OD/Aba6siyG1lU2c
         z1OwtcMqrVSBNFfSJuXAyEwJm130MgYj1M0DY4MYc9502a3dPlkTzuo6nTSf2B6l6XBF
         YZXIsOrknhQWIGuCJn16nbTPwkRjnHhxml+TE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=taVVHXZCysabggYX/eGgapEaTg3NQMt2ZeKA+oMMy3I=;
        b=febklkaH7+kznnjbk97h9jKRQkmXQm28eaBZYoylHLlbyTXX/jNSeT5UQb32v8ZDkt
         A+ZR0FYV7H48hdnbr6vmnBvHvXU4tmuB3+bY49xG43t/oEHrUYUbvQuIHLbR5JN1Sl+t
         zbvyHWjR1oS1XoxXgFx+pakGuzHszrhmt3vnxOvldS+fwiJJa0ZJ5GXFzdSuDicvYANX
         Q9KWkb++4tC5DbDNeLVi8iiDP/OvQM0ycuft08WgFiZdoSWwLyA4ZDRhM9CaMd3ATWCc
         rr+q4ujqODGWV7rw+8VNiatFRz6uqY0n5YkXJdf59Yu7epKFImoIH6cjHg3IXUjv9xi5
         6thA==
X-Gm-Message-State: AJIora/6jnFN/lbH61b5W/bvR7sHHflcjTBHwtMB2EUa/x3H4GD5khOQ
	i/uVvzskGrpAepJtmz6ZOR/Tdg==
X-Google-Smtp-Source: AGRyM1uoKaCiZv0+fpTWPpuM9ND4xOyr/blnINkpSw7fBsHkFaVi9rFyGkmQDAjwDg53Z8zzxFe+YQ==
X-Received: by 2002:a63:5111:0:b0:411:83dc:d48b with SMTP id f17-20020a635111000000b0041183dcd48bmr4229310pgb.266.1657301078745;
        Fri, 08 Jul 2022 10:24:38 -0700 (PDT)
Received: from chromium.org (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id t24-20020aa79478000000b00528c149fe97sm5050650pfq.89.2022.07.08.10.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 10:24:38 -0700 (PDT)
Date: Fri, 8 Jul 2022 17:24:36 +0000
From: Prashant Malani <pmalani@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev, bleung@chromium.org,
	heikki.krogerus@linux.intel.com,
	Daisuke Nojiri <dnojiri@chromium.org>,
	"Dustin L. Howett" <dustin@howett.net>,
	Guenter Roeck <groeck@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: Re: [PATCH v3 1/9] usb: typec: Add support for retimers
Message-ID: <YshoVFnUafCXObxb@chromium.org>
References: <20220707222045.1415417-1-pmalani@chromium.org>
 <20220707222045.1415417-2-pmalani@chromium.org>
 <YsglSJvB/bvwSGZ2@kroah.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YsglSJvB/bvwSGZ2@kroah.com>

Hi Greg,

On Jul 08 14:38, Greg Kroah-Hartman wrote:
> On Thu, Jul 07, 2022 at 10:20:08PM +0000, Prashant Malani wrote:
> > Introduce a retimer device class and associated functions that register
> > and use retimer "switch" devices. These operate in a manner similar to
> > the "mode-switch" and help configure retimers that exist between the
> > Type-C connector and host controller(s).
> > 
> > Type C ports can be linked to retimers using firmware node device
> > references (again, in a manner similar to "mode-switch").
> > 
> > Signed-off-by: Prashant Malani <pmalani@chromium.org>
> 
> As you are adding things to sysfs, do you need to add any
> Documentation/ABI/ entries as well?  I can't see any new sysfs files
> being created here, but explicitly saying so in the changelog here would
> be good.

There are no new sysfs files being created (there is the new retimer
class directory, but there are no class-specific files being created
there).

I will send out a v4 which calls this out in the changelog.

Best regards,

-Prashant
