Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AF120F7
	for <chrome-platform@lists.linux.dev>; Mon, 27 Nov 2023 03:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iFL2Qpgv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FE8BC433C7;
	Mon, 27 Nov 2023 03:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701055850;
	bh=ld7B3dp+GDxlYtYurW0Gktp/AE4BoIK39/RjUzIlx6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iFL2QpgvP9PaJFD1AeGsdndBdGgi02QHgHknPTkFaNrjOkONuXhmA84frKAJTK65e
	 a+bTCP2lbpcsyOFoFrx2iAU2q4wDR24HmVvQH5qlvhJ6urfyvqKN0A81b1nx1xXKVM
	 h593LA+KfqsyI7SUEkIyCCNpqN1NZDDRKqBwjC0UASqAo5aa0rUWlVzXtHwETbdTx9
	 r3hhzoyxkM5NN9U35BfBzqCJ1ykP9rjWTVT1zPb9bHpS+8qrHz/882SC/y+L38WZJn
	 D9UXACEqwjJSygz1UU063r547qCNOiA+474BBkZg2bC3v+RCXARkxt8ac7oxouDEa4
	 88MpdMFVQI1lg==
Date: Mon, 27 Nov 2023 11:30:46 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Dustin Howett <dustin@howett.net>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, Kieran Levin <ktl@frame.work>,
	Mario Limonciello <Mario.Limonciello@amd.com>
Subject: Re: [PATCH v1 0/4] cros_ec: add support for newer versions of the
 Framework Laptop
Message-ID: <ZWQNZtcg2qTSc5ze@google.com>
References: <20231005160701.19987-1-dustin@howett.net>
 <ZSYypHZiRXo7qK5_@google.com>
 <CA+BfgNL7OeqbXPGf=hk=XrTWoe0_Wv0pi95YgWw5SJjzs8EXeQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+BfgNL7OeqbXPGf=hk=XrTWoe0_Wv0pi95YgWw5SJjzs8EXeQ@mail.gmail.com>

On Sun, Nov 26, 2023 at 01:22:23PM -0600, Dustin Howett wrote:
> On Wed, Oct 11, 2023 at 12:29 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> >
> > On Thu, Oct 05, 2023 at 11:06:57AM -0500, Dustin L. Howett wrote:
> > I don't understand the description about 0x8FF.  From patches in the series,
> > it looks like 0x8FF is unused if CROS_EC_LPC_QUIRK_SHORT_HOSTCMD_RESERVATION.
> 
> You're right, this is unclear.
> 
> The ACPI node for [...]EC0 only claims to use 0x800 to 0x8FE -
> *however*, the EC does use 0x8FF!
> The bug is only in the ACPI table.
> The quirk is used so that devm_request_region doesn't fail
> because it would try to reserve up to 0x8FF.

I am not familiar to ACPI, so this may be a dumb question: if the bug is in
the ACPI table, is it possible to correct the table to claim to use 0x800
to 0x8FF?

> I have been considering a different form for this quirk.
> Right now, it means "do not reserve 0x8ff, but continue to USE 0x8ff".
> Perhaps "ignore devm_request_region failures" is a better quirk? It
> felt too broad.

Either way is suboptimal to me.
