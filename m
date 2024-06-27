Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6B813E04F
	for <chrome-platform@lists.linux.dev>; Thu, 27 Jun 2024 23:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719532729; cv=none; b=HY3OEH3uYNRVyPzd4G+H6UK1zRciyDENgvwkA5ogbEiod/TCLmaUaKQy46f/lIPXtlLD2YzlZ+1WKcFCd0+HOyEpXImQDEMjrTnZ1fx0r6mMgMpUYsEXWCNPOhL8QI3EFAaDabklWR08AZbgsGVIxXMGgOY9ck2jteVMg6K2g7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719532729; c=relaxed/simple;
	bh=v65OtUCDBmq2UINiXyuxk40IqkzNuvUQPqxvy5lE0WM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fk3vMkpoC/JPkauQx8zxE51kbBjIza1Sv0tAO+oGa9jtrcfWOc2OeiUX5dVMpdJkLVjMI7TZbmbTJensiKE4j9dLRWZQEr5i6THOKJq8JF71yOWPq4/k3mNfl5uZapmjlKwlj3cLmqABPOtd6FOOJcfyugUdJMn9Mv+v+299K6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S2MxGf9N; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S2MxGf9N"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7182a634815so2096a12.3
        for <chrome-platform@lists.linux.dev>; Thu, 27 Jun 2024 16:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719532727; x=1720137527; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NgDBoXjux0uTdi2Gv8P11eaLmeWdzLWKwn2+FzWWXtY=;
        b=S2MxGf9NxIp5xnQ+VPE3fBHQoBkH9iaCXn+pk661fbzMXgXcAZADj+KNEOJEmjCbVu
         P45F2+R0JoCYQXFsWmmm/uAtVSJbLLPZb0V3lpNXmTPYULrVFuoGsXhpQrCyROhzcNxQ
         ahfFMq+lMShevSuscEjivxIb2VsFjP4Pgs0vgg+D2eIadU4HtAUQL8E+kglPsx6rHhwR
         febN9UFR3sZ1m3l0lp6ELRjta7AtX/XdkfWDy3kGIYBZa57/yLmO9Y6Sc7hILNFXQXld
         YlRNP8Aqr0OzH4TteslmSEwjbo9goJVgo0kfm4YmCJ5BRKgNCwi4nNO+JG8k1E4V0Vcn
         CZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719532727; x=1720137527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NgDBoXjux0uTdi2Gv8P11eaLmeWdzLWKwn2+FzWWXtY=;
        b=JfoquMIj7m+DnM+9RFbeZ0KoL/53smuixgjHLaw+PNriGWaiNE1HcV8LX+TpDDPLEo
         81G+2OCsyVjzNGAZCk6ttHOGnglcktikYQsSdQ6nihpR1PIfsRSlp/I2DIi0aZfZPERY
         sgIkbLMrqUnfDLIouzLHBfWR6awOLvFonfDmnXTB2J66Qmaa8/hViW/bRQJJ9vtuh0PQ
         KIpcpu1nPO+kTOT/syqSbtSmlKHQThcWv031GRfGjuXmMJQxxKQN4KkKF/tUvlclDEih
         l2yPqCcWooh+YIvD57xmhGbykhhFRLfu9bvdOkYE6WC/wsag2q1ImciqqZ9PfgZwKmJn
         xiIg==
X-Forwarded-Encrypted: i=1; AJvYcCWWsdnusqyZKgDNaulUt2sInylRx/SxxYjOT6enM4e/QBZVkRk8AZ/bs5ktCHSyU6C0vlo5W/N7WKMW4PkHMpfO5jxLHdzVCT1zs8F40vfL
X-Gm-Message-State: AOJu0YyDL8aMpK+N7CVSG4aS8Y6DtMxJeU1e+9szFhPkaAs/APbnKMmZ
	uaQgA3C8Uc38/Oto5R9sG9CZPg+zw2cXKc6E7GoHyiEiloNmt6FI
X-Google-Smtp-Source: AGHT+IEDLd5ZoDkbSEQ6trwkEJZB5AUPTmKzP6li6lPY1EkpzX1dByte/d7Cp4bPEzF+fFwFT+8AoQ==
X-Received: by 2002:a05:6a21:32aa:b0:1bd:1d0f:f14b with SMTP id adf61e73a8af0-1becd5e4c08mr4594233637.10.1719532727088;
        Thu, 27 Jun 2024 16:58:47 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:c929:2998:720d:a104])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac1537337sm3463565ad.160.2024.06.27.16.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 16:58:46 -0700 (PDT)
Date: Thu, 27 Jun 2024 16:58:44 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Daisuke Nojiri <dnojiri@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Reka Norman <rekanorman@chromium.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Gwendal Grignou <gwendal@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Lukasz Majczak <lma@chromium.org>,
	Ching-Kang Yen <chingkang@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/2] dt-bindings: cros-ec-keyboard: Add keyboard
 matrix v3.0
Message-ID: <Zn38tH4INnO8RgtF@google.com>
References: <cover.1719531519.git.dnojiri@chromium.org>
 <9ae4d96cc2ce8c9de8755b9beffb78c641100fe7.1719531519.git.dnojiri@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ae4d96cc2ce8c9de8755b9beffb78c641100fe7.1719531519.git.dnojiri@chromium.org>

On Thu, Jun 27, 2024 at 04:53:08PM -0700, Daisuke Nojiri wrote:
> Add support for keyboard matrix version 3.0, which reduces keyboard
> ghosting.
> 
> Signed-off-by: Daisuke Nojiri <dnojiri@chromium.org>

Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
