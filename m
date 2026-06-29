Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1181487BE;
	Mon, 29 Jun 2026 03:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782702877; cv=none; b=bB9/mvLKRxGTtAvUGlJ2gZkTMcEiz6e4Vofvydtv6fqnQqVSwuZoc0yXkGo0Zgz9RpWd3nGVIEiXVJhTPeiPfo3ODeE/Q+s84sj/BdF1ge+frX2ZhMwtzMwZ26GoQqBZfTJ1L+IMl3nFWdPoGBhawx7mw+LBSz0gDKStEbZWgOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782702877; c=relaxed/simple;
	bh=PiAP9MK2aT/rBCQV7Op4e6gSanRXs6XoW5jw/1kPkw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qImMGUbDJshV/avIv4MmzMil+4e9kjpKPl6YrftuIcwBiHTcqxxOwHpii0lSzu454sr0T8QeOWWYaEwbatexkBC+kPdiPZ3oqmlqO4UK6HG7lbV3lCK7IKQCO2Fr4brcMVFPIRPhqTUKaiBH5hm5/WpGltxqRNTjVocP8PN5jG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mslbA0nE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mslbA0nE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC2321F000E9;
	Mon, 29 Jun 2026 03:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782702876;
	bh=70Pn2DWN/1Fl5NG5RT3HT75/6eC2tZ90Bc36BjBOieU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mslbA0nEOLxugUXkDXGJXsrPwgXYUIQrNOa71rqdUnSnoy0C/eQjxk58+rmQG+cdA
	 iLs+z8aNqEcv2MfkYOIx52TdCzbRH41JtWnc+1Mn6a1ltVH5NipHCbJLvJtiJysvLl
	 KALDEayjMCUl2SuTsuXThsYYNSn3bdjAXy8zI1m8UT4Xx4y5DbRzD7IFgrYAQ5iO5h
	 4UbeBa+A0Cx2LitZ9Wv9Bi7eusoIhFuq8JjtFqmT4otswKbgBoeawjybXXoEogzbux
	 nwdCPseF+C/cgKkkZFJivEFl1R0IkFVqdvfwZCoHZW7qeYfG+aeZEg5b1OXsigrbj8
	 /0AYltqkzx23A==
Date: Mon, 29 Jun 2026 03:14:33 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Kaixuan Li <kaixuan.li@ntu.edu.sg>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] platform/chrome: cros_ec_typec: reject out-of-bounds
 PD cap count
Message-ID: <akHjGa8SdB2a7w_0@google.com>
References: <20260625130056.3378097-1-maoyixie.tju@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625130056.3378097-1-maoyixie.tju@gmail.com>

On Thu, Jun 25, 2026 at 09:00:56PM +0800, Maoyi Xie wrote:
> cros_typec_register_partner_pdos() copies the partner PDOs from the EC
> TYPEC_STATUS response into the fixed caps_desc.pdo[PDO_MAX_OBJECTS] array.
> 
> 	memcpy(caps_desc.pdo, resp->source_cap_pdos,
> 	       sizeof(u32) * resp->source_cap_count);
> 	...
> 	memcpy(caps_desc.pdo, resp->sink_cap_pdos,
> 	       sizeof(u32) * resp->sink_cap_count);
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/1] platform/chrome: cros_ec_typec: reject out-of-bounds PD cap count
      commit: a0a8cd9fc9c48b95095bcec4b146f7a99486f58e

Thanks!
