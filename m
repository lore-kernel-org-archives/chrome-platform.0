Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41C131F999
	for <chrome-platform@lists.linux.dev>; Tue,  5 May 2026 13:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987206; cv=none; b=CoTfDhmgPKzS+bXsG8Mk8XBCu6wU3Legb95A963oMfDBLPONc2xYY7dL7y1K7fXqdZNi3Q3yvR+p0DmsgWG/BL1Rqo6ho4eZoEcLuvK81CbJ5vO705Q1cGycteckjR9KNjzkK9rL99LsC6iaUCJ3giYA+P4RAH/mM/bQyr9ho3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987206; c=relaxed/simple;
	bh=ibbhpUEspwDnILnKp6x/633TsOLMgM9F3dwGA03ePeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PeTvkCZQHuZbdzCqe2mkG+AR5sSGCLkkBOJiUv7qQ+b6hWMrg5QZ4eB/UOk0TBwAx55Giqwxo+8POadeQgXbWE3y5ppX339/pMQt68Pfv+Kl3HGrOrQiHzOaOjDhHdyI6N5w/fuv3VCUvIUxDxL+1xiW8lcbgnvrp1h5PV/IkfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dAOeJmvh; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dAOeJmvh"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12dbd0f7ecaso11564027c88.0
        for <chrome-platform@lists.linux.dev>; Tue, 05 May 2026 06:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777987204; x=1778592004; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/hZDbpmJBO/sT/pu/TH8yzpFbPIu2coGqQ48qccMAdc=;
        b=dAOeJmvhdhzpUyZwOBae+S1Ou5mFR+5g46FWQNCVN+s0X45mCxkX/T+AwrIDuWJMyt
         qLrlgwb29fhSHzqLbbXLrDPGFH35jb8fwajGLHy/FuMmx1/gYZ27/X0fUuy53VrqopTl
         UYVaTkctQORc5rr/KM0PGlD/ghMTHI+pomTw6ijv/rvPut79PWpd5v2+EGZYZTYsvqS9
         47IUG/bqEYBrHrBnDctn5f1vFAQqB20qGL3dY2J0fmZt5f/S/om1jJ7XueaRT2Pyy+Ko
         FXP2yhH0pGIgE0gnVJ72UByes7Z8WfdVqMVEB1zWhiie2D5ZOE9COIj+UnkmOyX8deig
         7/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777987204; x=1778592004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/hZDbpmJBO/sT/pu/TH8yzpFbPIu2coGqQ48qccMAdc=;
        b=DrxfBHBaTOSy9d1Nx5ridYiFnSPOlhloMd4954VtTVD5NSt6lawWw1goJcX8GCbh6H
         5Czp2QnSvyN03fe3mJmvaDaUCtzNbYgT9nqMDPIRg1t5YVYP4DAnifJRcHiXWpdSxWO7
         XJ1x5L8FgTHzLYaJK/DoF4on5dNFYf349PNTMT+W9OAf84QP77LS1lFo/uRfR5Jf0upM
         m1RdZdcef3s9rnhkj6yWNTkioUAoEvXs1SLFU8l7YbdwqVoTch+BqNlnvYY04sXThlWm
         t9CoEJSPXUTd7vgBQ3JhtmE8gKH4xcMbUBAhRsCqYd6fBPCvEKvO5m+svi+GWZ3t8zL8
         sg/Q==
X-Forwarded-Encrypted: i=1; AFNElJ8uYj/7xsJZPneeLDquVDrdM1obpbFJrT99CiIiWMLfAX3K9bQZO4Ny71SuBEQHX5kYiKqazQNY/YzShngdhyc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyaL1xuIPoE+875s09tm9gB7NTv0X3Tr6+pYRQCagoW2TANKi3c
	7VWFiLoaiFeTUKKeu6h4oiyD7SUlleKKEJTW4ePk0kour+lRtG3kLu1M
X-Gm-Gg: AeBDievxeNBu5Dm3txf03D5gLHquLCK2SsFyG6oI+qk0yve2CgyxBQJ/pZNqHaCSPXK
	j2QK4xdOQb6zvbIyDsCBrXFNCdEtea0rZCBYY40+AeChsud+RrwGJohT+WEEgmxGk8q26SQF6xv
	xE2CJ1NWvID74qqzl61KatwT2BncVIYTw7dsfv/FkddTNy1MaqiRV8zJE+93fq9M2eCo4nAgf8q
	eYrav6H6+u5ZcrjDJxu2StjOUuHW8+tCaW6i6ASN+Kc6Uhpw5eTetUrMzZZhPlg+ucQoJQ2kr3U
	kGlRVIXYRnJw92JnUlH3FLI9kNMr2mTBzascGb9/7PE1bzvMRTYIf/8fF2fvzMqf+fHRTzq/ICP
	wdljgm7QOTKwf7Kf7vaz2S80N7PfNrWW/WBtVp40B+cLcNG0IwhGvQobjxn9Azd8xJ92qiANTPr
	OiTHTnL0ctKQg+h1UDmmqsO2a1+rGeVrVoJ1VUV/ixYRiDMmA=
X-Received: by 2002:a05:7022:791:b0:12d:de3f:d845 with SMTP id a92af1059eb24-12dfd878a73mr6644320c88.40.1777987203611;
        Tue, 05 May 2026 06:20:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df843f04esm17670938c88.13.2026.05.05.06.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 06:20:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 5 May 2026 06:20:02 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Benson Leung <bleung@chromium.org>, Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Subject: Re: [PATCH] hwmon: Move MODULE_DEVICE_TABLE next to the table itself
Message-ID: <f0aca43d-6fa2-4e24-aee1-17943fab6b62@roeck-us.net>
References: <20260505102923.189289-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505102923.189289-2-krzysztof.kozlowski@oss.qualcomm.com>

On Tue, May 05, 2026 at 12:29:22PM +0200, Krzysztof Kozlowski wrote:
> By convention MODULE_DEVICE_TABLE() immediately follows the ID table it
> exports, because this is easier to read and verify.  It also makes more
> sense since #ifdef for ACPI or OF could hide both of them.
> 
> Most of the privers already have this correctly placed, so adjust
> the missing ones.  No functional impact.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
