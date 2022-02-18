Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A394611
	for <chrome-platform@lists.linux.dev>; Fri, 18 Feb 2022 02:32:56 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id n19-20020a17090ade9300b001b9892a7bf9so11088619pjv.5
        for <chrome-platform@lists.linux.dev>; Thu, 17 Feb 2022 18:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZLG8uJp+BpA2htbua/3laYldmj1lDeY2B/07do9xAI0=;
        b=ovgsgV/PKxygjlyH/XpwIT7Mbe4X7wH3rhT9GVLxWu+UUa/Lv1EdNyAEYt9+Bj77Gx
         HUNVxPgp/fEVL67qSZqu80UPkOSVt+rUPE6ZrwUPad5u4wDAIf3hSiq0AEw9AvMJxw0y
         uRP2qATic/TLF96adM2/xGoo0M/CrwmQtdJgNVrWd4TwhEhBBNmOJVzR+BGYGfgOJ/io
         iJhph6qRPZ4LS/wWlkwSZ0LfUF9QowsazCMGLVv20RKPeBSz9GvhKOnmxzTiL8XnsRPf
         LKGMGTcplwTeV1XQAJUdE8OjTp86AfhxVlrAumnhuU8RvFEFwo+RJdqFmEJ6zXbEvCtw
         ojew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZLG8uJp+BpA2htbua/3laYldmj1lDeY2B/07do9xAI0=;
        b=hGEPU4aXh9HcuSs00sOZC24YNJ/6UMtrynwnAHbZ+gcMHlIv6wAotAvwMb8h9HwJkQ
         ovkSSr/x6EDgg357MPvOJsKZGpe6utjHgOQNfc2/ZV2z0UbCuKiufgQ0DKtB6Wnr5vg3
         AAjYzRsWs+6ZoFCCLaxHOm9dCTVz/hUrwS4WVMsKxACG61WAbcYQeAP+hna23YpFghT5
         pvgiH9iFO6ioXrhsbXtho8y3Jjje8SvfHzQY5K/QbC+0QgfP9cOwFpsJQSIyY88KIbsY
         NQWJLQl4ltDlE5hG5oDhtwOB34Pzywoaghw9LSQHCRfQL+IDP8XNBjEW3ntcPWYExlh8
         wAzw==
X-Gm-Message-State: AOAM530djpWIzAB229AX/n1hV7VzxtZujGkeS7IZ/yK7DiBXqlHb07df
	EFDJb40mJ5GyBAuQB08YqZHZMw==
X-Google-Smtp-Source: ABdhPJxD/WMeaWVjGgnExjZsqzQ+DCcmSqJM2svABIkGfJOOoQ3HIqS7MnIZoEz1GJ9/l2ebqkSGjA==
X-Received: by 2002:a17:90b:1d0f:b0:1b9:fdb1:2994 with SMTP id on15-20020a17090b1d0f00b001b9fdb12994mr10459847pjb.53.1645151576212;
        Thu, 17 Feb 2022 18:32:56 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:98da:c40c:7d40:9254])
        by smtp.gmail.com with ESMTPSA id m14sm901257pfc.170.2022.02.17.18.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 18:32:55 -0800 (PST)
Date: Fri, 18 Feb 2022 10:32:48 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: "Dustin L. Howett" <dustin@howett.net>
Cc: chrome-platform@lists.linux.dev, Benson Leung <bleung@chromium.org>,
	Aseda Aboagye <aaboagye@chromium.org>,
	Michael Niksa <michael.niksa@live.com>
Subject: Re: [PATCH v3 0/2] platform/chrome: add support for the Framework
 Laptop
Message-ID: <Yg8FUKy+aEOXVzJY@google.com>
References: <20220217165930.15081-1-dustin@howett.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220217165930.15081-1-dustin@howett.net>

On Thu, Feb 17, 2022 at 10:59:28AM -0600, Dustin L. Howett wrote:
> This series adds support for the Framework Laptop to the cros_ec LPC
> driver.
> 
> The Framework Laptop is a non-Chromebook laptop that uses the ChromeOS
> Embedded Controller. Since the machine was designed to present a more
> normal device profile, it does not report all 512 I/O ports that are
> typically used by cros_ec_lpcs. Because of this, changes to the driver's
> port reservation scheme were required.
> 
> Since this EC driver probes the MEC range first, and uses only the MEC
> range if that probe succeeds[^1], we can get by without requesting the
> entire port range required by non-MEC embedded controllers until
> absolutely necessary.
> 
> [^1]: this includes "memory mapped" read - where the traditional LPC EC
> requires I/O ports 0x900-0x9FF, the MEC EC multiplexes reads/writes
> over the same eight ports, 0x800-0x807.
> 
> Changes in v2:
>   - Cleaned up the commit subjects per request.
> Changes in v3:
>   - Sync'd cros_ec_commands.h with the EC changelist at
>     https://chromium-review.googlesource.com/c/chromiumos/platform/ec/+/3460548
> 
> Dustin L. Howett (2):
>   platform/chrome: cros_ec_lpcs: detect the Framework Laptop
>   platform/chrome: cros_ec_lpcs: reserve the MEC LPC I/O ports first

For the series,
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
