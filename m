Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551123ADB99;
	Wed, 24 Jun 2026 08:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782289293; cv=none; b=dKBfmOQcxlRSWJUlRnq14aYtyW8gWfGzXR37QsUpIopVdFsTOf+aDa22TdmB+SRPwLtdu6WIfrwV+Xfwhmu4hkiB2H3mQpFdOo2OBCYoA67z/HmIKKJrkZUQUyL6u7tMlJXA3yEs5VFgCTwoXbntyaz/SgDBiOUMkCAJBxEaBCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782289293; c=relaxed/simple;
	bh=s2Eyw1xRRiyKkfnJwsP2ixxeRr9ewsmd6JzKhUbktiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q9XTvjyieNdEcu9sQcbx/Wir4Po3x8MfDkQ2AJxLZIlZJOtXA+vPkEwl8POevcXswWqT2Z5xDoLoPIwhabaE7359LMIx9QOB6zeyHNO0GI+KxCwRNUVyqM3LpSeU/RlH04jqZp87dpVw4aURgp7uMkgY3kyVCX6naBJv5lZuW70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I3/j3X9n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I3/j3X9n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C6A1F000E9;
	Wed, 24 Jun 2026 08:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782289285;
	bh=GXTzQfTj8UQrlRoYi+aCn29zuTQlXesUGgDh1lOcshw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I3/j3X9nGflilER5ljBQYX/l6800Nxa4ZKDHUlqQ6GA1GXfk+6rnVF99FXTuFIBT1
	 NveI1R54YuKTkOMHznuZeWaILKmVBUvUBO4ZhmS0esv6oyXx8A5GJhMxO40uUeVK2O
	 /mpIzukH7ljPmZNh0rpOX1azsmioiZkyqqo3E7ezhPfaTKqtblBllxW3TKSm+ZuDFN
	 K3djWcyn8AelAEb/fzyQv9w1ITi9Hs0WC9w/LtnfcQUEWdaZfFdsC/xuT3d20QJGBy
	 d8A4hQ9XrDoID7xg9CaiEuvHRnH3/0qmdjHEOO63Ytu9RvpMjPCEzd2kpTrLKMigKt
	 nrAkUVNbGe1Ig==
Date: Wed, 24 Jun 2026 08:21:22 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: platform/chrome: cros_ec_typec: unbounded PD cap count in
 cros_typec_register_partner_pdos()
Message-ID: <ajuTgiZvOdbZF8B-@google.com>
References: <178214588280.2375438.11710758336343332732@maoyixie.com>
 <ajtwHGY7MaeClHN_@google.com>
 <CAHPEe=FUvt7-C1UZVntUFR5y7rk+=dSOK96UGqK4wOTKTdYoRg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHPEe=FUvt7-C1UZVntUFR5y7rk+=dSOK96UGqK4wOTKTdYoRg@mail.gmail.com>

On Wed, Jun 24, 2026 at 03:00:48PM +0800, Maoyi Xie wrote:
> > How did you reproduce the overflow?  Was this by modifying the EC firmware
> > to send larger counts, or can this be triggered by a non-compliant USB-C
> > partner device?
> 
> I did not modify the EC firmware and I did not have a real partner. I do
> not have cros_ec hardware. I ran the same copy in a small standalone test,
> a u32 pdo[7] on the stack with a count above 7, and it tripped the stack
> protector. So this is a source review plus that test, not a hardware repro.
> 
> I also cannot confirm that a non-compliant partner can push the count past
> 7. That depends on whether the EC already caps it, which I cannot see. It
> may well need buggy or compromised EC firmware. I assumed the partner path
> in my mail and I should not have stated it so firmly.

FWIW: the ChromeOS EC firmware caps the counts[1].

[1] https://chromium.googlesource.com/chromiumos/platform/ec/+/refs/heads/main/common/usb_pd_host_cmd_common.c#301
