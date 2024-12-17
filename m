Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA011F8ADF
	for <chrome-platform@lists.linux.dev>; Tue, 17 Dec 2024 18:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734461929; cv=none; b=SCnF2ikwoZ4jw2VWH53k/ApGXWDlKlnNnYU2cDoihRnPVJsCwrEEA0Hh71OAzJwqdc7oGE6LgDbHEQ+DYOmI74Fdvq6bw1XsgWx/qfM3wtka5Ti4ZCtg/XZsP1xONa2myUHB8LtgrV/1gltFXmBMipnt4kysSqcMfx3d2ikIaAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734461929; c=relaxed/simple;
	bh=fbHCKnfG5NRep7BfY0oobhD0kOGNRHN5i/W+xzw1qWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aAb6mjvEcxNb+bufc2wbmCqRIgXQzmn2SbrM9B//gDGcQW8dPPoxZu99lgX+PTG88Z+pY1iHhzfzqhgXa+bmms5/rBkJ7D1Jn1Rhf+NIFIDN3sWwE5sQxfIjoRCP4+D+og9QyTccrR7U603tv1J5Iw6g/wNq3rj+X2v3k9VNmtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=I+WDdntw; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="I+WDdntw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734461925;
	bh=fbHCKnfG5NRep7BfY0oobhD0kOGNRHN5i/W+xzw1qWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I+WDdntwN2YaV3qOxpeCQWGNdY5z2byTtquxZOwOwIlaugNaYa65yLtdJOBDgajse
	 GdYWsLTrZj8ehD4d7cjNLOQ6EN7N4OSF6uUG4RdpLST2G6uyGdeG0EZ5P4Y5UfRyKL
	 zuGw3TdxYX44cQQ4P0YLyIKoEL8llOe0QcuewkL4=
Date: Tue, 17 Dec 2024 19:58:44 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Brian Norris <briannorris@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, 
	Julius Werner <jwerner@chromium.org>, chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] firmware: google: Constify 'struct bin_attribute'
Message-ID: <3b905b05-d8dc-479f-8f9e-dae7b119b539@t-8ch.de>
References: <20241215-sysfs-const-bin_attr-google-v1-0-e5c2808f5833@weissschuh.net>
 <Z2ClAB6qY5LaMuHQ@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z2ClAB6qY5LaMuHQ@google.com>

On 2024-12-16 14:09:04-0800, Brian Norris wrote:
> On Sun, Dec 15, 2024 at 03:49:08PM +0100, Thomas Weißschuh wrote:
> > The sysfs core now allows instances of 'struct bin_attribute' to be
> > moved into read-only memory. Make use of that to protect them against
> > accidental or malicious modifications.
> 
> I'm not in love with all these "_new" transformations that need a second
> round of cleanup, but I'm not aware of any better way to do it.

Absolutely agree. My hope is to get the post-transition cleanup directly
through Linus or Greg in one big commit. At that point the changes are
purely mechanical and trivial.
So I don't have to annoy everyone even more...

> For the series:
> 
> Acked-by: Brian Norris <briannorris@chromium.org>

Thanks.

[..]
