Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4435920B1F8
	for <chrome-platform@lists.linux.dev>; Tue, 12 Nov 2024 07:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731397327; cv=none; b=YnJjv3FVv6t8hu2I+C8z9tJAvIaTCh9df34FTKSeM36ypfAGIcYrs+3qHhzLMHZej4ri92n1xQtJfFx0n5ZRsS6LWF2i9szGpbDwevUcWzNUademYOP6Fivf6xvmklj1Vlaq+ujXOs4fqPVKxlaQH7zxt+HIW5d6bmiRvX8SeLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731397327; c=relaxed/simple;
	bh=4Zdw5kgKTgwPsGUNYQa35eedlMhMIviirI6Hy+Sd0hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dwhKhn+rERDBzKoeXSVo0N/p9rZaoNqrIMHi+P3WDM4T2c+XKKFO46XtV6EorGrJI4XwrhViPg9GpxtMYYSCjIUyukoEVekwHASH/IvXNh2c1U2st5tztQanWaD8Si0fWqgQkN8TL9qUDm3qjBvo1hKZdBfEZnZ/DXfaj82tlDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cxIZ3ZtK; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cxIZ3ZtK"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7181a8af549so3320221a34.2
        for <chrome-platform@lists.linux.dev>; Mon, 11 Nov 2024 23:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731397325; x=1732002125; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mWb+6hjmOAxlNgDc7JKg2yzzLTEdqJ06FfSb5owKkeM=;
        b=cxIZ3ZtKRpzgcSLpPgVmH3ifjAYAKHExWpo5hb6Ov9mrr4tIATjDfe6UWshWjnQs3s
         XPKKKsVbkTrnykCbRSJYnz97VdLRLruRzLpwysSxh9S/AicV2ZStrGJIeq9sm8pUVRk6
         kv5vgS66cplY3bqcAvU4e269SRfSGkLuO3j0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731397325; x=1732002125;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWb+6hjmOAxlNgDc7JKg2yzzLTEdqJ06FfSb5owKkeM=;
        b=RO7Yc+XjrWmZQStuCm4dz0fj2VR7Ccb2qrsd978EBRQvu/5kJ98gGPzA7mc/unGIbf
         u7G6Lb5ccfjdCN1wQwEDKOauOdok8LypYtXzxqciOy0+ruH7WjQfHT4SDYgngHQbcDJ5
         vCKpXAc8VRpxEnk8Y4+UYwUcfT9Az7sQeKQrtSB4ZtT1LInvmsuJ5ejJfZNyPcfNeYgr
         PlANG1DHFkYN9cXHxKm0d4/6BGzSxkQin5matSxsCoqKqY9E5hcqUe5qHkQ6T5NlDhEN
         v85NY76iM9he9HQFvpTWXBs5cy+q0S7FmRKNyQWiLqqFf0e6fWNuBaq4KpgyJLWZFJgc
         7bWw==
X-Forwarded-Encrypted: i=1; AJvYcCU3Xq7G2jvKZAhPO0f5UOTv2IfkGhIMh19vPvUbIumQjIoMrvIebd9l+VWY2e+Rsu33Y5dYNmU5qu1q8iogXNs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwTfPBH9/ZZBtdjML++a2io4nCWDVUep08mX97Fh8Sx534PSc2R
	M3MvJwPpNPPQYNPRPYYYfkEvB7QTxbqwmjkS56k3IDL1r3OyBhhbiZbicJbpJw==
X-Google-Smtp-Source: AGHT+IHAivkem+e7/fcFL3MNsRfeSzjTTUbqrvF8zF3iiVeiJL0WKCuRtYmXL80k54VkCTs+Wi5+3g==
X-Received: by 2002:a05:6830:1050:b0:71a:21c9:cd82 with SMTP id 46e09a7af769-71a21c9d013mr9830707a34.0.1731397325430;
        Mon, 11 Nov 2024 23:42:05 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:7cd:9f36:34ae:c525])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f67f079sm9823430a12.85.2024.11.11.23.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 23:42:04 -0800 (PST)
Date: Tue, 12 Nov 2024 15:42:01 +0800
From: "Sung-Chi, Li" <lschyi@chromium.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@weissschuh.net>,
	Jean Delvare <jdelvare@suse.com>, devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (cros_ec) register thermal sensors to thermal
 framework
Message-ID: <ZzMGyaBGX-yLZs8B@google.com>
References: <20241111074904.1059268-1-lschyi@chromium.org>
 <20241111095045.1218986-1-lschyi@chromium.org>
 <4cb3b1c7-86fa-4344-a413-031723f31f1d@roeck-us.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4cb3b1c7-86fa-4344-a413-031723f31f1d@roeck-us.net>

On Mon, Nov 11, 2024 at 09:01:33AM -0800, Guenter Roeck wrote:
> On 11/11/24 01:50, Sung-Chi wrote:
> > From: "Sung-Chi, Li" <lschyi@chromium.org>
> > 
> > cros_ec hwmon driver probes available thermal sensors when probing the
> > driver.  Register these thermal sensors to the thermal framework, such
> > that thermal framework can adopt these sensors as well.
> > 
> > To make cros_ec registrable to thermal framework, the cros_ec dts need
> > the corresponding changes:
> > 
> > &cros_ec {
> > 	#thermal-sensor-cells = <1>;
> > };
> > 
> > Change-Id: I29b638427c715cb44391496881fc61ad53abccaf
> 
> Drop.
> 
> > Signed-off-by: Sung-Chi, Li <lschyi@chromium.org>
> 
> Detailed explanation will be needed: Why not use HWMON_C_REGISTER_TZ ?
> Unless I am missing something, this code just duplicates code from the hwmon core.
> 
> Please do not send follow-up patch series as response to previous ones.
> 
> Guenter
> 

Hi, thank you for pointing out using HWMON_C_REGISTER_TZ. After checking how
HWMON_C_REGSITER_TZ works, I think I only need to add one line into the
cros_ec_hwmon_info, and almost all concerns Thomas pointed out in latest reply
would be resolved automatically (because there would be only one line of change,
and that change is just a hwmon configuration, so should be a valid way of
combining with the thermal system).

Thank all for reviewing and giving inputs, and I will soon send out the one
line patch.

Best,
Sung-Chi, Li
