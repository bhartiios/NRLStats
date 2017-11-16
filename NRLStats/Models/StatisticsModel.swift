//
//  Statistics.swift
//  NRLStats
//
//  Created by Bharti Sharma on 16/11/17.
//  Copyright © 2017 Bharti Sharma. All rights reserved.
//

import Foundation

struct StatisticsModel {
    
    var errors = 0
    var goals = 0
    var intercepted = 0
    var intercepts = 0
    var kicks = 0
    var points = 0
    var possessions = 0
    var runs = 0
    var tackles = 0
    var tries = 0
    var minsPlayed = 0
    var attackingKicks = 0
    var bombsCaught = 0
    var bombsDropped = 0
    var chargedDown = 0
    var chargesDown = 0
    var dropOuts = 0
    var dummyHalfRuns = 0
    var effectiveOffloads = 0
    var fantasyPoints = 0
    var fieldGoalAttempts = 0
    var fieldGoalMisses = 0
    var fieldGoals = 0
    var forcedDropOuts = 0
    var generalPlayPass = 0
    var goalMisses = 0
    var ineffectiveTackles = 0
    var inGoalEscapes = 0
    var interchangesOff = 0
    var interchangesOn = 0
    var kickErrors = 0
    var kickMetres = 0
    var kickReturnMetres = 0
    var kickReturns = 0
    var kicks4020 = 0
    var kicksDead = 0
    var lastTouchTryAssists = 0
    var lineBreakAssists = 0
    var lineBreakCauses = 0
    var lineBreaks = 0
    var lineEngagements = 0
    var longKicks = 0
    var missedTackles = 0
    var offLoads = 0
    var onePassRuns = 0
    var penaltiesConceded = 0
    var playTheBalls = 0
    var runMetres = 0
    var runs7lessMeters = 0
    var runs8plusMeters = 0
    var sendOffs = 0
    var sinBins = 0
    var stealsOneOnOne = 0
    var stolenOneOnOne = 0
    var tackleBusts = 0
    var tackledOpp20 = 0
    var tackleOppHalf = 0
    var tacklesOneOnOne = 0
    var tryAssists = 0
    var tryCauses = 0
    var tryContributionPercentage = 0
    var tryContributions = 0
    var tryInvolvements = 0
    var twentyMetreRestarts = 0
    var weightedKicks = 0
    
    
    /// Fill all the data
    ///
    /// - Parameter dicResponse: response
    mutating func fillStatsData(dicResponse:[String:Any]){
        
        guard let dicStats = dicResponse["last_match_stats"] as? [String:Any] else{
            return
        }
        
        if let value = dicStats["errors"] as? NSNumber{
            errors = value.intValue
        }
        if let value = dicStats["goals"] as? NSNumber{
            goals = value.intValue
        }
        if let value = dicStats["intercepted"] as? NSNumber{
            intercepted = value.intValue
        }
        if let value = dicStats["intercepts"] as? NSNumber{
            intercepts = value.intValue
        }
        if let value = dicStats["kicks"] as? NSNumber{
            kicks = value.intValue
        }
        if let value = dicStats["points"] as? NSNumber{
            points = value.intValue
        }
        if let value = dicStats["possessions"] as? NSNumber{
            possessions = value.intValue
        }
        if let value = dicStats["runs"] as? NSNumber{
            runs = value.intValue
        }
        if let value = dicStats["tackles"] as? NSNumber{
            tackles = value.intValue
        }
        if let value = dicStats["tries"] as? NSNumber{
            tries = value.intValue
        }
        if let value = dicStats["mins_played"] as? NSNumber{
            minsPlayed = value.intValue
        }
        if let value = dicStats["attacking_kicks"] as? NSNumber{
            attackingKicks = value.intValue
        }
        if let value = dicStats["bombs_caught"] as? NSNumber{
            bombsCaught = value.intValue
        }
        if let value = dicStats["bombs_dropped"] as? NSNumber{
            bombsDropped = value.intValue
        }
        if let value = dicStats["charged_down"] as? NSNumber{
            chargedDown = value.intValue
        }
        if let value = dicStats["charges_down"] as? NSNumber{
            chargesDown = value.intValue
        }
        if let value = dicStats["drop_outs"] as? NSNumber{
            dropOuts = value.intValue
        }
        if let value = dicStats["dummy_half_runs"] as? NSNumber{
            dummyHalfRuns = value.intValue
        }
        if let value = dicStats["effective_offloads"] as? NSNumber{
            effectiveOffloads = value.intValue
        }
        if let value = dicStats["fantasy_points"] as? NSNumber{
            fantasyPoints = value.intValue
        }
        if let value = dicStats["field_goal_attempts"] as? NSNumber{
            fieldGoalAttempts = value.intValue
        }
        if let value = dicStats["field_goal_misses"] as? NSNumber{
            fieldGoalMisses = value.intValue
        }
        if let value = dicStats["field_goals"] as? NSNumber{
            fieldGoals = value.intValue
        }
        if let value = dicStats["forced_drop_outs"] as? NSNumber{
            forcedDropOuts = value.intValue
        }
        if let value = dicStats["general_play_pass"] as? NSNumber{
            generalPlayPass = value.intValue
        }
        if let value = dicStats["goal_misses"] as? NSNumber{
            goalMisses = value.intValue
        }
        if let value = dicStats["ineffective_tackles"] as? NSNumber{
            ineffectiveTackles = value.intValue
        }
        if let value = dicStats["in_goal_escapes"] as? NSNumber{
            inGoalEscapes = value.intValue
        }
        if let value = dicStats["interchanges_off"] as? NSNumber{
            interchangesOff = value.intValue
        }
        if let value = dicStats["interchanges_on"] as? NSNumber{
            interchangesOn = value.intValue
        }
        if let value = dicStats["kick_errors"] as? NSNumber{
            kickErrors = value.intValue
        }
        if let value = dicStats["kick_metres"] as? NSNumber{
            kickMetres = value.intValue
        }
        if let value = dicStats["kick_return_metres"] as? NSNumber{
            kickReturnMetres = value.intValue
        }
        if let value = dicStats["kick_returns"] as? NSNumber{
            kickReturns = value.intValue
        }
        if let value = dicStats["kicks_4020"] as? NSNumber{
            kicks4020 = value.intValue
        }
        if let value = dicStats["kicks_dead"] as? NSNumber{
            kicksDead = value.intValue
        }
        if let value = dicStats["last_touch_try_assists"] as? NSNumber{
            lastTouchTryAssists = value.intValue
        }
        if let value = dicStats["line_break_assists"] as? NSNumber{
            lineBreakAssists = value.intValue
        }
        if let value = dicStats["line_break_causes"] as? NSNumber{
            lineBreakCauses = value.intValue
        }
        if let value = dicStats["line_breaks"] as? NSNumber{
            lineBreaks = value.intValue
        }
        if let value = dicStats["line_engagements"] as? NSNumber{
            lineEngagements = value.intValue
        }
        if let value = dicStats["long_kicks"] as? NSNumber{
            longKicks = value.intValue
        }
        if let value = dicStats["missed_tackles"] as? NSNumber{
            missedTackles = value.intValue
        }
        if let value = dicStats["off_loads"] as? NSNumber{
            offLoads = value.intValue
        }
        if let value = dicStats["one_pass_runs"] as? NSNumber{
            onePassRuns = value.intValue
        }
        if let value = dicStats["penalties_conceded"] as? NSNumber{
            penaltiesConceded = value.intValue
        }
        if let value = dicStats["play_the_balls"] as? NSNumber{
            playTheBalls = value.intValue
        }
        if let value = dicStats["run_metres"] as? NSNumber{
            runMetres = value.intValue
        }
        if let value = dicStats["runs_7less_meters"] as? NSNumber{
            runs7lessMeters = value.intValue
        }
        if let value = dicStats["runs_8plus_meters"] as? NSNumber{
            runs8plusMeters = value.intValue
        }
        if let value = dicStats["send_offs"] as? NSNumber{
            sendOffs = value.intValue
        }
        if let value = dicStats["sin_bins"] as? NSNumber{
            sinBins = value.intValue
        }
        if let value = dicStats["steals_one_on_one"] as? NSNumber{
            stealsOneOnOne = value.intValue
        }
        if let value = dicStats["stolen_one_on_one"] as? NSNumber{
            stolenOneOnOne = value.intValue
        }
        if let value = dicStats["tackle_busts"] as? NSNumber{
            tackleBusts = value.intValue
        }
        if let value = dicStats["tackled_opp20"] as? NSNumber{
            tackledOpp20 = value.intValue
        }
        if let value = dicStats["tackle_opp_half"] as? NSNumber{
            tackleOppHalf = value.intValue
        }
        if let value = dicStats["tackles_one_on_one"] as? NSNumber{
            tacklesOneOnOne = value.intValue
        }
        if let value = dicStats["try_assists"] as? NSNumber{
            tryAssists = value.intValue
        }
        if let value = dicStats["try_causes"] as? NSNumber{
            tryCauses = value.intValue
        }
        if let value = dicStats["try_contribution_percentage"] as? NSNumber{
            tryContributionPercentage = value.intValue
        }
        if let value = dicStats["try_contributions"] as? NSNumber{
            tryContributions = value.intValue
        }
        if let value = dicStats["try_involvements"] as? NSNumber{
            tryInvolvements = value.intValue
        }
        if let value = dicStats["twenty_metre_restarts"] as? NSNumber{
            twentyMetreRestarts = value.intValue
        }
        if let value = dicStats["weighted_kicks"] as? NSNumber{
            weightedKicks = value.intValue
        }
    }
}
