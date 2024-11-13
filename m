Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D012D057
	for <chrome-platform@lists.linux.dev>; Wed, 13 Nov 2024 03:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731467074; cv=none; b=R4Zx5bhcSEkgB5XzxQKfpcfWA4Bihthve8JZ8TA2J4TkAsqWOs4+t7br1CIkxySQR1iU6bHp84fwPXYmLL+wKQJHGRT/OhUEOxlce87tPGCgIaHSXqpfflt4utwlJ1oEyGCfzu07hdYAZOr1ja3OOBhPU7PmF0iqtb48V/6FOeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731467074; c=relaxed/simple;
	bh=EuxKVNmpNGfrOiahUvynnVXT5qofaDA0cpfjiP0F1SU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=czVc96AfxhQ1KgssaUTIwQrgHD+Ra1MtHyT1x5fk/bPa1vcGfndhcnCc1q7WcAnHjM/as65A4ZtmE5D1xabDldTJNiR4rHOsgf3Gey+ZxVsaDRhFa9w/BjeEXXGdXqLBzn0DEpPPfreCCxNiauQF7b/CkhlNEZpRtsTARt6Iipw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a0FPl/+H; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a0FPl/+H"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-71e592d7f6eso4780786b3a.3
        for <chrome-platform@lists.linux.dev>; Tue, 12 Nov 2024 19:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731467072; x=1732071872; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P4y2OBEpapBr/wW9aW632V6tkwGQczTUHp3LH8E+LKc=;
        b=a0FPl/+H9gko10pGPY7gpndR2YFexXFXDmZhW1yznH9XTg1m+S47bVJ6RL24fTr5rp
         foGfJYfaCHaSHLGjhXqoDZXX5JtDcCSHIIO0do8FfiJhb1KN3i/WLpVAT/AvCflwLXdK
         tb4AvdSkF/0KHJ4HsVAcZ9k8WkqJpYG9HQaDzX+RDIHSST0lxI6Ssgj0yMyzV+oOIS14
         6aBZxWWlGlz8fCHkKNQfwv/jpaWec+0dhxLaZ9adAxkHgYWBHZyy4ophrCW77znxoSzL
         z4jBH4RCDvwEJE4XNZuXJ0r/L/Cx0GQX5DB/g5di8FqhQ14svP2zIO+Qi+whfy/MsJYA
         fYhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731467072; x=1732071872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P4y2OBEpapBr/wW9aW632V6tkwGQczTUHp3LH8E+LKc=;
        b=cq03i3dkw5hpdHGzOpP0dUWutEOigjBW1j3hsq/Z/4TqDcKuc+3zOBoSemeqlAwQAo
         70ZFAMtVQTqJ6jiuzuefFl+LvrBqD1kwwvXQZiognVt+7FAE2mrYhUh5fGKkspU4q972
         0WYHLvYVLZmYYc7N4VsXUEXkPLX+erM9SeTR0YzClyy3nOUBzZGteWaiP46HEUMSOtbq
         SuDm+6Qn9zaX5CAJrKtAO8jnB+d8bHbNtrya8UjaCzTYSVyLbpqDyXeGNm3afbiR8ojT
         LrTbw3+8VwbYCQ3vuVxbKkciDChgYKaVO2Ual6kqc/EHpAFZVwNQMV+Ot6ITte4OpcTS
         NUCA==
X-Forwarded-Encrypted: i=1; AJvYcCWfPK74MBQ0mrY1opxNI/0vebHX0Il47kUh+7FYSJgdsDc/Vi8Hha3TYQHPFIcZOfx++dlu87zPIEeMMMGzlOA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxPdPk71tHAgJZ5Sum+X5it2JqRs0nZRsDnmLrqNT5ZLmJ9CoUa
	2zi7fbP28J+gp8IkczJL/nXJ/pbMa9xSSLDOHuNJnQpFIVDFt31trnY1tQ==
X-Google-Smtp-Source: AGHT+IHKHAm+cuL8lFCVMojYZqRqYhNq8Jtwk1CRNj2ESswXVkFPqmbb7UYjGkXkoHENzLQUmPqBbw==
X-Received: by 2002:a05:6a20:4c17:b0:1db:e9d8:be4f with SMTP id adf61e73a8af0-1dc22af3e51mr18186998637.29.1731467072421;
        Tue, 12 Nov 2024 19:04:32 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f65aa9csm11213055a12.74.2024.11.12.19.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 19:04:31 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 12 Nov 2024 19:04:30 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: "Sung-Chi, Li" <lschyi@chromium.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@weissschuh.net>,
	Jean Delvare <jdelvare@suse.com>, devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 1/2] hwmon: (cros_ec) register thermal sensors to
 thermal framework
Message-ID: <39ffe084-0bc4-4f6a-9b10-aee6dd493db5@roeck-us.net>
References: <20241111074904.1059268-1-lschyi@chromium.org>
 <20241113024000.3327161-1-lschyi@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113024000.3327161-1-lschyi@chromium.org>

On Wed, Nov 13, 2024 at 10:39:51AM +0800, Sung-Chi, Li wrote:
> cros_ec hwmon driver probes available thermal sensors when probing the
> driver.  Register these thermal sensors to the thermal framework as well
> via setting HWMON_C_REGISTER_TZ as a chip info, such that thermal
> framework can adopt these sensors as well.
> 
> To make cros_ec registrable to thermal framework, the cros_ec dts need
> the corresponding changes:
> 
> &cros_ec {
> 	#thermal-sensor-cells = <1>;
> };
> 
> Signed-off-by: Sung-Chi, Li <lschyi@chromium.org>

Applied.

Thanks,
Guenter
